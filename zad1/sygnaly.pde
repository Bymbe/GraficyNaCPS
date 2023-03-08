class Signal { //szum
  float signalS; // start of signal
  float signalE; // end of signal
  FloatList amp;
  float[] time = new float[1000];
  public Signal(float signalStart, float signalEnd, int amplitude) { //konstruktor
    signalS = signalStart;
    signalE = signalEnd;
    amp = new FloatList(amplitude);
    for (int i=0; i<amplitude; i++)
      amp.set(i, 0);
  }
  public Signal(float[] zT) {
    signalS = zT[0];
    signalE = zT[1];
    amp = new FloatList(zT[2]);
    for (int i = 0; i < zT[2]; i++)
      amp.set(i, 0);
  }
  public void calculate() {
  }
}

class ContinuosSignal extends Signal {
  public ContinuosSignal(float signalStart, float signalEnd, int amplitude) {
    super(signalStart, signalEnd, amplitude);
  }
  public ContinuosSignal(float[] zT) {
    super(zT);
  }
  public void calculate() {
    int j = 0;
    for (float i = signalS; i <= signalE; i += (signalE - signalS) * 0.001) {
      amp.set(j, random(-amp.size(), amp.size()));
      time[j] = i;
      j++;
    }
  }
}

class Gauss extends Signal { //szum gaussa
  float avg;
  float dev;
  public Gauss(float signalStart, float signalEnd, int amplitude, float average0, float devation1) {
    super(signalStart, signalEnd, amplitude);
    avg = average0;
    dev = devation1;
  }
  public void calculate() {
    int j = 0;
    for (float i = signalS; i <= signalE; i += (signalE - signalS) * 0.001) {
      float first = 1/(dev*sqrt(TWO_PI));
      float third = (-1 * pow((i - avg), 2)) / (2*pow(dev, 2));
      float second = pow(exp(1.0), third);
      amp.set(j, (first * second) + random(-amp.size(), amp.size()));
      time[j] = i;
      j++;
    }
  }
}

class Sinusoidal extends Signal {
  float term;
  public Sinusoidal(float signalStart, float signalEnd, int amplitude, float t) {
    super(signalStart, signalEnd, amplitude);
    term = t;
  }
  public Sinusoidal(float[] zT, float t) {
    super(zT);
    term = t;
  }
  public void calculate() {
    int j = 0;
    for (float i = signalS; i <= signalE; i += (signalE - signalS) * 0.001) {
      //okres podstawowy (T) –dla sygnału okresowego jest to minimalna wartość, dla której spełniona jest zależność: x(t)=x(t+kT)
      time[j] = i;
      float step = signalE - signalS / (amp.size() - 1);
      float period = i * step + signalS;
      amp.set(j, amp.size()*sin((TWO_PI / (term)) * (period-signalS)));
      j++;
    }
  }
}

class RectifiedOneSinusoidal extends Sinusoidal {
  public RectifiedOneSinusoidal(float signalStart, float signalEnd, int amplitude, float t) {
    super(signalStart, signalEnd, amplitude, t);
  }
  public RectifiedOneSinusoidal(float[] zT, float t) {
    super(zT, t);
  }
  public void calculate() {
    int j = 0;
    for (float i = signalS; i <= signalE; i += (signalE - signalS) * 0.001) {
      float step = signalE - signalS / (amp.size() - 1);
      float period = i * step + signalS;
      time[j] = i;
      amp.set(j, 0.5 * amp.size()*sin((TWO_PI / (term)) * (period-signalS)) + abs(sin(TWO_PI / (term)) * (period - signalS)));
      if (amp.get(j) <0) amp.set(j, 0); //czy o to chodzi?
      j++;
    }
  }
}

class RectifiedTwoSinusoidal extends Sinusoidal {
  public RectifiedTwoSinusoidal(float signalStart, float signalEnd, int amplitude, float t) {
    super(signalStart, signalEnd, amplitude, t);
  }
  public RectifiedTwoSinusoidal(float[] zT, float t) {
    super(zT, t);
  }
  public void calculate() {
    int j = 0;
    for (float i = signalS; i <= signalE; i += (signalE - signalS) * 0.001) {
      float step = signalE - signalS / (amp.size() - 1);
      float period = i * step + signalS;
      time[j] = i;
      amp.set(j, amp.size() * abs(sin((TWO_PI / (term)) * (period-signalS))));
      j++;
    }
  }
}

class Rectangular extends Sinusoidal {
  float fillFactor; // wspolczynnik wypelnienia - stosunek czasu trwania wartości maksymalnej do okresu
  public Rectangular(float signalStart, float signalEnd, int amplitude, float t, float fF) {
    super(signalStart, signalEnd, amplitude, t);
    fillFactor = fF;
  }
  public Rectangular(float[] zT, float t, float fF) {
    super(zT, t);
    fillFactor = fF;
  }
  public void calculate() {
    int j = 0;
    float step = signalE - signalS / (amp.size() - 1);
    for (float i = signalS; i <= signalE; i += (signalE - signalS) * 0.001) {
      float period = j * step + signalS;
      time[j] = i;
      //if (((period - signalS) / term) - floor((period - signalS) / term) <= fillFactor) {
      //(((period - (signalS + signalE) / 2) / term) - floor((period - (signalE + signalS) / 2) / term) <= fillFactor) {
      if (j < fillFactor * period + period + (signalE + signalS) / 2 && j < period + (signalE + signalS) / 2) {
        amp.set(j, amp.size());
      } else {
        amp.set(j, 0.0);
      }
      j++;
    }
  }
}

class SymmetricalRectangular extends Sinusoidal {
  float fillFactor; // wspolczynnik wypelnienia - stosunek czasu trwania wartości maksymalnej do okresu
  public SymmetricalRectangular(float signalStart, float signalEnd, int amplitude, float t, float fF) {
    super(signalStart, signalEnd, amplitude, t);
    fillFactor = fF;
  }
  public SymmetricalRectangular(float[] zT, float t, float fF) {
    super(zT, t);
    fillFactor = fF;
  }
  public void calculate() {
    int j = 0;
    for (float i = signalS; i <= signalE; i += (signalE - signalS) * 0.001) {
      float step = signalE - signalS / (amp.size() - 1);
      float period = i * step + signalS;
      time[j] = i;
      if (((period - (signalE + signalS) / 2) / term) - floor((period - (signalE + signalS) / 2) / term) < fillFactor) {
        //if (j < fillFactor * period + period + signalS && j < period + signalS) {
        amp.set(j, amp.size());
      } else {
        amp.set(j, -amp.size());
      }
      j++;
    }
  }
}

class Triangular extends Sinusoidal {
  float fillFactor; // wspolczynnik wypelnienia - stosunek czasu trwania wartości maksymalnej do okresu
  public Triangular(float signalStart, float signalEnd, int amplitude, float t, float fF) {
    super(signalStart, signalEnd, amplitude, t);
    fillFactor = fF;
  }
  public Triangular(float[] zT, float t, float fF) {
    super(zT, t);
    fillFactor = fF;
  }
  public void calculate() {
    int j = 0;
    float step = signalE - signalS / (amp.size() - 1);
    for (float i = signalS; i <= signalE; i += (signalE - signalS) * 0.001) {
      float period = j * step + signalS;
      float tac = ((period - signalS) / term) - floor((period - signalS) / term);
      time[j] = i;
      if (tac < fillFactor) {
        amp.set(j, tac / fillFactor * amp.size());
      } else {
        amp.set(j, tac / -fillFactor * amp.size());
        //amp.set(j, (1 - (tac - fillFactor) / (1 - fillFactor)) * amp.size());
      }
      j++;
    }
  }
}

class UnitStroke extends Signal {
  public UnitStroke(float signalStart, float signalEnd, int amplitude) {
    super(signalStart, signalEnd, amplitude);
  }
  public UnitStroke(float[] zT) {
    super(zT);
  }
  public void calculate() {
    int j = 0;
    for (float i = signalS; i <= signalE; i += (signalE - signalS) * 0.001) {
      float step = signalE - signalS / (amp.size() - 1);
      float period = i * step + signalS;
      time[j] = i;
      if (period > (signalS+signalE) / 2) { // od signalS do momentu kiedy period = signalS
        amp.set(j, amp.size());
      } else if (period == (signalS+signalE) / 2) { // period = signalS+signalE / 2
        amp.set(j, amp.size() * 0.5);
      } else {
        amp.set(j, 0.0);
      }
      j++;
    }
  }
}
