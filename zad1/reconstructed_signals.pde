public class ReconstructedSignalFirstOrderHold extends Signal {
  private Signal sourceSignal;

  public ReconstructedSignalFirstOrderHold(Signal sS) {
    super(sS.signalS, sS.signalE, sS.ampl);
    this.sourceSignal = sS;
  }

  public void calculate() {
    int index = 0;
    for (float i = signalS; i <= signalE; i += (signalE - signalS) / RECONSTRUCTED_SAMPLE_NUMBER) {
      index = floor((i - signalS) / (signalE - signalS) * RECONSTRUCTED_SAMPLE_NUMBER);
      if (index < RECONSTRUCTED_SAMPLE_NUMBER - 1) {
        sourceSignal.amp.set(i, i - (index * (1.0 / RECONSTRUCTED_SAMPLE_NUMBER) + sourceSignal.signalS)) /
          ((index + 1) * (1.0 / RECONSTRUCTED_SAMPLE_NUMBER) + sourceSignal.signalS) - (index * (1.0 / RECONSTRUCTED_SAMPLE_NUMBER) + sourceSignal.signalS)) *
          (sourceSignal.amp.get(index + 1) - sourceSignal.amp.get(index)) + sourceSignal.amp.get(index);
      } else {
        sourceSignal.amp.set(i, index);
      }
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
    for (float i = signalS; i <= signalE; i += (signalE - signalS) / RECONSTRUCTED_SAMPLE_NUMBER) {
      index = floor((i - signalS) / (signalE - signalS) * RECONSTRUCTED_SAMPLE_NUMBER);
      sourceSignal.amp.set(i, index);
    }
  }
}
