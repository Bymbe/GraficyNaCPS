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
      /* calculate value */
      final float step = (signalE - signalS) / RECONSTRUCTED_SAMPLE_NUMBER;
      float sum = 0.0;
      for (int k = int(firstSample); k < lastSample; k++) {
        sum += this.amp.get(int((k) * (i / step - k)));
      }
      this.amp.set(j, sum);
      //time[j] = i;
      j++;
    }
  }
}

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
    int index = 0;
    int j = 0;
    for (float i = signalS; i <= signalE; i += (signalE - signalS) / RECONSTRUCTED_SAMPLE_NUMBER) {
      index = floor((i - signalS) / (signalE - signalS) * RECONSTRUCTED_SAMPLE_NUMBER);
      this.amp.set(j, index);
      //this.time[j] = i;
      j++;
    }
  }
}
