class Signal { //szum
  float signalS; // start of signal
  float signalE; // end of signal
  FloatList amp; // tablica przechowujaca X
  float[] time = new float[SAMPLE_NUMBER]; // tablica przechowujaca Y
  int ampl; // amplitude
  public Signal(float signalStart, float signalEnd, int amplitude) { //konstruktor
    signalS = signalStart;
    signalE = signalEnd;
    amp = new FloatList(SAMPLE_NUMBER);
    ampl = amplitude;
    for (int i = 0; i < SAMPLE_NUMBER; i++)
      amp.set(i, 0);
  }
  public Signal(float[] zT) {
    signalS = zT[0];
    signalE = zT[1];
    amp = new FloatList(SAMPLE_NUMBER);
    ampl = int(zT[2]);
    for (int i = 0; i < SAMPLE_NUMBER; i++)
      amp.set(i, 0);
  }
  public Signal(float signalStart, float signalEnd, float[] X, float[] Y, int amplitude) {
    amp = new FloatList(SAMPLE_NUMBER);
    for (int i = 0; i < Y.length; i++) {
      amp.set(i, Y[i]);
      time[i] = X[i];
    }
    signalS = signalStart;
    signalE = signalEnd;
    ampl = amplitude;
  }
  public void calculate() {
  }
  public void setAmplitude(int a) {
    ampl = a;
  }
  public int getAmplitude() {
    return ampl;
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
    for (float i = signalS; i <= signalE; i += (signalE - signalS) / SAMPLE_NUMBER) {
      amp.set(j, random(-ampl, ampl));
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
    for (float i = signalS; i <= signalE; i += (signalE - signalS) / SAMPLE_NUMBER) {
      float first = 1/(dev*sqrt(TWO_PI));
      float third = (-1 * pow((i - avg), 2)) / (2*pow(dev, 2));
      float second = pow(exp(1.0), third);
      amp.set(j, (first * second) + random(-ampl, ampl));
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
    float step = signalE - signalS / (ampl - 1);
    for (float i = signalS; i <= signalE; i += (signalE - signalS) / SAMPLE_NUMBER) {
      //okres podstawowy (T) –dla sygnału okresowego jest to minimalna wartość, dla której spełniona jest zależność: x(t)=x(t+kT)
      time[j] = i;
      float period = i * step + signalS;
      amp.set(j, ampl*sin((TWO_PI / (term)) * (period-signalS)));
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
    float step = signalE - signalS / (ampl - 1);
    for (float i = signalS; i <= signalE; i += (signalE - signalS) / SAMPLE_NUMBER) {
      float period = i * step + signalS;
      time[j] = i;
      amp.set(j, 0.5 * ampl*sin((TWO_PI / (term)) * (period-signalS)));// + abs(sin(TWO_PI / (term)) * (period - signalS)));
      if (amp.get(j) < 0) {
        amp.set(j, 0.0);
      }
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
    float step = signalE - signalS / (ampl - 1);
    for (float i = signalS; i <= signalE; i += (signalE - signalS) / SAMPLE_NUMBER) {
      float period = i * step + signalS;
      time[j] = i;
      amp.set(j, ampl * abs(sin((TWO_PI / (term)) * (period-signalS))));
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
    float step = signalE - signalS / (ampl - 1);
    for (float i = signalS; i <= signalE; i += (signalE - signalS) / SAMPLE_NUMBER) {
      float period = i * step + signalS;
      time[j] = i;
      //if (((period - signalS) / term) - floor((period - signalS) / term) <= fillFactor) {
      //if (((period - (signalS + signalE) / 2) / term) - floor((period - (signalE + signalS) / 2) / term) <= fillFactor) {
      //if (j < fillFactor * period + period + (signalE + signalS) / 2 && j < period + (signalE + signalS) / 2) {
      //if (((period - signalS) / term) - floor((period - signalS) / term) < fillFactor) {
        if (j * fillFactor > period * fillFactor) {
        amp.set(j, ampl);
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
    float step = signalE - signalS / (ampl - 1);
    for (float i = signalS; i <= signalE; i += (signalE - signalS) / SAMPLE_NUMBER) {
      float period = i * step + signalS;
      time[j] = i;
      if (((period - (signalE + signalS) / 2) / term) - floor((period - (signalE + signalS) / 2) / term) < fillFactor) {
        //if (j < fillFactor * period + period + signalS && j < period + signalS) {
        amp.set(j, ampl);
      } else {
        amp.set(j, -ampl);
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
    float step = signalE - signalS / (ampl - 1);
    //boolean yes = true;
    for (float i = signalS; i <= signalE; i += (signalE - signalS) / SAMPLE_NUMBER) {
      float period = i * step + signalS;
      float tac = ((period - signalS) / term) - floor((period - signalS) / term);
      time[j] = i;
      if (/*yes*/ tac > fillFactor) {
        amp.set(j, tac / fillFactor * ampl);
      } else {
        amp.set(j, -tac / fillFactor * ampl);
      }
      /*if (j == 0) {
       } else {
       if (amp.get(j) <= ampl && amp.get(j) > amp.get(j - 1)) {
       yes = true;
       } else {
       yes = false;
       }
       }*/
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
    for (float i = signalS; i <= signalE; i += (signalE - signalS) / SAMPLE_NUMBER) {
      float step = signalE - signalS / (ampl - 1);
      float period = i * step + signalS;
      time[j] = i;
      if (period > (signalS+signalE) / 2) { // od signalS do momentu kiedy period = signalS
        amp.set(j, ampl);
      } else if (period == (signalS+signalE) / 2) { // period = signalS+signalE / 2
        amp.set(j, ampl * 0.5);
      } else {
        amp.set(j, 0.0);
      }
      j++;
    }
  }
}
