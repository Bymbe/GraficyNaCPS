public class ReconstructedSignalFirstOrderHold extends Signal {
  private Signal sourceSignal;

  public ReconstructedSignalFirstOrderHold(Signal sS) {
    super(sS.signalS, sS.signalE, sS.ampl);
    this.sourceSignal = sS;
  }

  public void calculate() {
    for (float i = signalS; i <= signalE; i += (signalE - signalS) / SAMPLE_NUMBER) {
      float index = floor((i - signalS) / (signalE - signalS) * SAMPLE_NUMBER);
      //if (index < SAMPLE_NUMBER - 1) {
      //  return (i - sourceSignal.argument(index)) /
      //    (sourceSignal.argument(index + 1) - sourceSignal.argument(index)) *
      //    (sourceSignal.value(index + 1) - sourceSignal.value(index)) + sourceSignal.value(index);
      //} else {
      //  return sourceSignal.value(index);
      //}
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
  }
}
