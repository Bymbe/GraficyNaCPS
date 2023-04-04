class ReconstructedSignalZeroOrderHold extends Signal {
  public ReconstructedSignalZeroOrderHold(Signal S) {
    super(S.signalS, S.signalE, S.ampl);
  }

  public void calculate() {
  }
}

class ReconstructedSignalSincBasic extends Signal {
  float sampleR;
  Signal sourceSignal;

  public ReconstructedSignalSincBasic(Signal S, float sR) {
    super(S.signalS, S.signalE, S.ampl);
    sourceSignal = S;
    sampleR = sR;
  }
  public void calculate() {
    float[] sinc = new float[int(sampleR)];
    for (int i = 0; i < SAMPLE_NUMBER; i++) {
      float x = time[i] - signalS; // przesunięcie czasowe
      float sum = 0;
      for (int j = 0; j < sampleR; j++) {
        if (j == sampleR / 2) {
          // omijamy punkt środkowy, aby uniknąć dzielenia przez zero
          continue;
        }
        float t = (j - sampleR / 2) * (1.0f / SAMPLE_RATE); // czas dla punktu próbkowania funkcji sinc
        float sincValue = (float)sin(PI * (x - t)) / (PI * (x - t)); // wartość funkcji sinc
        sum += sourceSignal.amp.get(i) * sincValue;
      }
      amp.set(i, sum);
    }
  }
}

class ReconstructedSignalFirstOrderHold extends Signal {
  public ReconstructedSignalFirstOrderHold(Signal S) {
    super(S.signalS, S.signalE, S.ampl);
  }

  public void calculate() {
    float step = (signalE - signalS) / (SAMPLE_NUMBER - 1);
    float currentTime = signalS;
    for (int i = 0; i < SAMPLE_NUMBER; i++) {
      int nextIndex = findNextIndex(currentTime);
      if (nextIndex == -1) {
        // current time is after the last point, use the last value
        amp.set(i, amp.get(SAMPLE_NUMBER - 1));
      } else if (nextIndex == 0) {
        // current time is before the first point, use the first value
        amp.set(i, amp.get(0));
      } else {
        // interpolate between two points
        float x1 = time[nextIndex - 1];
        float y1 = amp.get(nextIndex - 1);
        float x2 = time[nextIndex];
        float y2 = amp.get(nextIndex);
        float y = lerp(y1, y2, (currentTime - x1) / (x2 - x1));
        amp.set(i, y);
      }
      currentTime += step;
    }
  }

  private int findNextIndex(float currentTime) {
    for (int i = 0; i < SAMPLE_NUMBER; i++) {
      if (time[i] >= currentTime) {
        return i;
      }
    }
    return -1;
  }

  private float lerp(float a, float b, float t) {
    return a + (b - a) * t;
  }
}

/*
public class ReconstructedSignalFirstOrderHold extends Signal {
 float[] time = new float[RECONSTRUCTED_SAMPLE_NUMBER]; // tablica przechowujaca Y
 float sampleR;
 Signal S;
 
 public ReconstructedSignalFirstOrderHold(Signal sS, float sR) {
 super(sS.signalS, sS.signalE, sS.ampl);
 this.amp = new FloatList(RECONSTRUCTED_SAMPLE_NUMBER);
 for (int i = 0; i < sS.amp.size(); i++) {
 this.amp.set(i, sS.amp.get(i));
 }
 this.time = sS.time;
 this.sampleR = sR;
 }
 
 public float argument(float t) {
 return t * (1.0 / sampleR) + this.signalS;
 }
 
 //chat gpt be like:
 public void enumerate() {
 //int length = int(signalE - signalS);
 //int j = 0;
 //float[] interpolated_signal = new float[2 * length - 1];
 //for (int i = 0; i < this.amp.size(); i++) {
 //  interpolated_signal[i] = this.amp.get(i);
 //}
 //for (float i = signalS; i <= signalE; i += (signalE - signalS) / RECONSTRUCTED_SAMPLE_NUMBER) {
 //  for (int k = 1; k < 2; k = 2 * length - 2) {
 //    interpolated_signal[k] = (this.amp.get(floor(k / 2.0)) + this.amp.get(floor(k / 3.0))) / 2.0;
 //  }
 //  this.amp.set(j, interpolated_signal[j]);
 //  j++;
 //}
 }
 
 public void enumerate() {
 int index = 0;
 int j = 0;
 for (float i = signalS; i <= signalE; i += (signalE - signalS) / RECONSTRUCTED_SAMPLE_NUMBER) {
 index = floor((i - signalS) / (signalE - signalS) * RECONSTRUCTED_SAMPLE_NUMBER);
 if (index < RECONSTRUCTED_SAMPLE_NUMBER - 1) {
 this.amp.set(j, (i - this.argument(index)) /
 (this.argument(index + 1) - this.argument(index)) *
 (this.argument(index + 1) - this.argument(index)) + this.argument(index));
 } else {
 this.amp.set(j, this.argument(index));
 }
 //time[j] = i;
 j++;
 }
 }
 }
 */

/*
public class ReconstructedSignalSincBasic extends Signal {
 float[] time = new float[RECONSTRUCTED_SAMPLE_NUMBER]; // tablica przechowujaca Y
 private int N;
 
 public ReconstructedSignalSincBasic(Signal sS, int n) {
 super(sS.signalS, sS.signalE, sS.ampl);
 this.amp = new FloatList(RECONSTRUCTED_SAMPLE_NUMBER);
 for (int i = 0; i < sS.amp.size(); i++) {
 this.amp.set(i, sS.amp.get(i));
 }
 this.time = sS.time;
 this.N = n;
 }
 private float sinc(float i) {
 if (i == 0.0) {
 return 1.0;
 } else {
 return sin(PI * i) / (PI * i);
 }
 }
 
 //chat gpt be like:
 public void enumerate() {
 //int n = int(this.signalE - this.signalS);
 //float[] interpolated_signal = new float[RECONSTRUCTED_SAMPLE_NUMBER];
 //int[] arr = new int[((n - 1) / 2 + 1) - (-1 * (n - 1) / 2) / 1];
 //for (int i = 0; i < arr.length; i++) {
 //  arr[i] = -1 * (n - 1) + i * 1;
 //}
 //int j = 0;
 //float sinc;
 //for (float i = signalS; i <= signalE; i += (signalE - signalS) / RECONSTRUCTED_SAMPLE_NUMBER) {
 //  for (int k = 0; k <RECONSTRUCTED_SAMPLE_NUMBER; k++) {
 //    sinc = sinc((i/1.0) - arr[k]);
 //    interpolated_signal[k] += (this.amp.get(j) * sinc);
 //  }
 //  this.amp.set(j, interpolated_signal[j]);
 //  j++;
 //}
 }
 
 public void enumerate() {
 int index = 0;
 int j = 0;
 for (float i = signalS; i <= signalE; i += (signalE - signalS) / RECONSTRUCTED_SAMPLE_NUMBER) {
 index = floor((i - signalS) / (signalE - signalS) * RECONSTRUCTED_SAMPLE_NUMBER);
 float firstSample = index - N / 2;
 float lastSample = firstSample + N;
 if (firstSample < 0) {
 lastSample = lastSample - firstSample;
 firstSample = 0;
 if (lastSample > RECONSTRUCTED_SAMPLE_NUMBER) {
 lastSample = RECONSTRUCTED_SAMPLE_NUMBER;
 }
 } else if (lastSample > RECONSTRUCTED_SAMPLE_NUMBER) {
 firstSample = firstSample - (lastSample - RECONSTRUCTED_SAMPLE_NUMBER);
 lastSample = RECONSTRUCTED_SAMPLE_NUMBER;
 if (firstSample < 0) {
 firstSample = 0;
 }
 }
 final float step = (signalE - signalS) / RECONSTRUCTED_SAMPLE_NUMBER;
 float sum = 0.0;
 for (int k = int(firstSample); k < lastSample; k++) {
 sum += this.amp.get(int((k) * sinc(i / step - k)));
 }
 this.amp.set(j, sum);
 //time[j] = i;
 j++;
 }
 }
 }
 */

/*
public class ReconstructedSignalZeroOrderHold extends Signal {
 float[] time = new float[RECONSTRUCTED_SAMPLE_NUMBER]; // tablica przechowujaca Y
 
 public ReconstructedSignalZeroOrderHold(Signal sS) {
 super(sS.signalS, sS.signalE, sS.ampl);
 this.amp = new FloatList(RECONSTRUCTED_SAMPLE_NUMBER);
 for (int i = 0; i < sS.amp.size(); i++) {
 this.amp.set(i, sS.amp.get(i));
 }
 this.time = sS.time;
 }
 
 public void enumerate() {
 //int index = 0;
 //int length = int(signalE - signalS);
 //int j = 0;
 //for (float i = signalS + 1; i <= signalE + 1; i += (signalE - signalS) / RECONSTRUCTED_SAMPLE_NUMBER) {
 //}
 }
 
 public void enumerate() {
 int index = 0;
 int j = 0;
 for (float i = signalS; i <= signalE; i += (signalE - signalS) / RECONSTRUCTED_SAMPLE_NUMBER) {
 index = floor((i - signalS) / (signalE - signalS) * SAMPLE_NUMBER);
 this.amp.set(j, index);
 //this.time[j] = i;
 j++;
 }
 }
 }
 */
