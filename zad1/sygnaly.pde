class Signal { //szum
  float signalS; // start of signal
  float signalE; // end of signal
  FloatList amp;
  float[] time = new float[1000];

  public Signal(float signalStart, float signalEnd, int amplitude) { //konstruktor
    signalS = signalStart;
    signalE = signalEnd;
    amp = new FloatList(amplitude);
    for(int i=0; i<amplitude; i++)
      amp.set(i, 0);
  }
  public Signal(float[] zT) {
    signalS = zT[0];
    signalE = zT[1];
    amp = new FloatList(zT[2]);
    for(int i=0; i<zT[2]; i++)
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
  public Sinusoidal(float signalStart, float signalEnd, int amplitude) {
        super(signalStart, signalEnd, amplitude);
  }
  public Sinusoidal(float[] zT) {
        super(zT);
  }
    public void calculate() {
    int j = 0;
    for (float i = signalS; i <= signalE; i += (signalE - signalS) * 0.001) {
      //okres podstawowy (T) –dla sygnału okresowego jest to minimalna wartość, dla której spełniona jest zależność: x(t)=x(t+kT)
      float period = amp.get(j)*((signalE-signalS)); // yyyy
      if( period < amp.get(j)*(signalE-signalS)) {
        period = amp.get(j)*(signalE-signalS);
      }      
      time[j] = i;
      amp.set(j, amp.size()*sin((TWO_PI / (period)) * (time[j]-signalS)));
      j++;
    }
  }
}

class StraightSinusoidal extends Signal {
  public StraightSinusoidal(float signalStart, float signalEnd, int amplitude) {
        super(signalStart, signalEnd, amplitude);
  }
    public StraightSinusoidal(float[] zT) {
        super(zT);
  }
    public void calculate() {
    int j = 0;
    for (float i = signalS; i <= signalE; i += (signalE - signalS) * 0.001) {
      float period = amp.get(j)*((signalE-signalS));
      if( period < amp.get(j)*(signalE-signalS)) {
        period = amp.get(j)*(signalE-signalS);
      }
      time[j] = i;
      amp.set(j, amp.size()*(sin((TWO_PI / (period)) * (time[j]-signalS))+abs(TWO_PI / (period)) * (time[j]-signalS)));
      j++;
    }
  }
}
