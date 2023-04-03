public class ReconstructedSignalFirstOrderHold extends Signal {
  private Signal sourceSignal;

  public ReconstructedSignalFirstOrderHold(Signal sS) {
    super(sS.signalS, sS.signalE, sS.ampl);
    this.sourceSignal = sS;
  }

  public void calculate() {
    int index = 0;
    int j = 0;
    for (float i = signalS; i <= signalE; i += (signalE - signalS) / RECONSTRUCTED_SAMPLE_NUMBER) {
      index = floor((i - signalS) / (signalE - signalS) * RECONSTRUCTED_SAMPLE_NUMBER);
      if (index < RECONSTRUCTED_SAMPLE_NUMBER - 1) {
        sourceSignal.amp.set(j, (i - (index * (1.0 / RECONSTRUCTED_SAMPLE_NUMBER) + signalS)) /
          ((i - ((index + 1.0) * (1.0 / RECONSTRUCTED_SAMPLE_NUMBER) + signalS) - (i - (index * (1.0 / RECONSTRUCTED_SAMPLE_NUMBER) + signalS)) *
          (sourceSignal.amp.get(index + 1) - sourceSignal.amp.get(index)) + sourceSignal.amp.get(index))));
      } else {
        sourceSignal.amp.set(j, index);
      }
      time[j] = i;
      j++;
    }
  }
}

public class ReconstructedSignalSincBasic extends Signal {
  private Signal sourceSignal;
  private int N;

  public ReconstructedSignalSincBasic(Signal sS) {
    super(sS.signalS, sS.signalE, sS.ampl);
    this.sourceSignal = sS;
  }
  private float sinc(float i) {
    if (i == 0.0) {
      return 1.0;
    } else {
      return sin(PI * i) / (PI * i);
    }
  }
  public void calculate() {
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
        sum += sourceSignal.amp.get(int((k) * (i / step - k)));
      }
      sourceSignal.amp.set(j, sum);
      time[j] = i;
      j++;
    }
  }
}

public class ReconstructedSignalZeroOrderHold extends Signal {
  private Signal sourceSignal;

  public ReconstructedSignalZeroOrderHold(Signal sS) {
    super(sS.signalS, sS.signalE, sS.ampl);
    this.sourceSignal = sS;
  }
  public void calculate() {
    int index = 0;
    int j = 0;
    for (float i = signalS; i <= signalE; i += (signalE - signalS) / RECONSTRUCTED_SAMPLE_NUMBER) {
      index = floor((i - signalS) / (signalE - signalS) * RECONSTRUCTED_SAMPLE_NUMBER);
      sourceSignal.amp.set(j, index);
      time[j] = i;
      j++;
    }
  }
}
