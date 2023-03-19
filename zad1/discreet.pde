class Discreet {
  float freq;
  FloatList amp;
  float[] time = new float[SAMPLE_NUMBER];
  float ampl;
  public Discreet(float f, float amplitude) {
    freq = f;
    amp = new FloatList(SAMPLE_NUMBER);
    ampl = amplitude;
    for (int i = 0; i < SAMPLE_NUMBER; i++)
      amp.set(i, 0);
  }
  public void setAmplitude(float a) {
    ampl = a;
  }
  public void calculate() {
  }
}

class UnitImpulse extends Discreet {
  float firstSample;
  float jumpSample;
  public UnitImpulse(float f, float amplitude, float fS, float jS) {
    super(f, amplitude);
    firstSample = fS;
    jumpSample = jS;
  }
  public void calculate() {
    int j = 0;
    for (float i = -firstSample; i < firstSample; i++) {
      time[j] = i;
      if (i == jumpSample) {
        amp.set(j, ampl);
      } else {
        amp.set(j, 0.0);
      }
      j++;
    }
  }
}

class NoiseImpulse extends Discreet {
  float probability;
  float noiseTime;
  public NoiseImpulse(float f, float amplitude, float p, float nT) {
    super(f, amplitude);
    probability = 100*p;
    noiseTime = nT;
  }
  public void setProbability(float p) {
    probability = p;
  }
  public void calculate() {
    int j = 0;
    for (float i = 0; i < noiseTime; i++) {
      time[j] = i;
      if ( random(100) < probability) { // probability to szansa na wystapienie na wykresie 1.0, trzeba obliczyc wartosc procentowa a potem skonstruowac if ktory dobrze zbalansuje 1.0 i 0.0
        amp.set(j, 1.0);
      } else {
        amp.set(j, 0.0);
      }
      j++;
    }
  }
}
