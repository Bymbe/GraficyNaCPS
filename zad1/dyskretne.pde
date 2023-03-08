class Discreet {
  float freq;
  FloatList amp;
  float[] time = new float[1000];
  public Discreet(float f, int amplitude) {
    freq = f;
    amp = new FloatList(amplitude);
    for (int i = 0; i < amplitude; i++)
      amp.set(i, 0);
  }
  public void calculate() {
  }
}

class UnitImpulse extends Discreet {
  float firstSample;
  float jumpSample;
  public UnitImpulse(float f, int amplitude, float fS, float jS) {
    super(f, amplitude);
    firstSample = fS;
    jumpSample = jS;
  }
  public void calculate() {
    int j = 0;
    for (float i = -firstSample; i < firstSample; i++) {
      time[j] = i;
      if (i == jumpSample) {
        amp.set(j, 1.0);
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
  public NoiseImpulse(float f, int amplitude, float p, float nT) {
    super(f, amplitude);
    probability = p;
    noiseTime = nT;
  }
  public void calculate() {
    int j = 0;
    for (float i = 0; i < noiseTime; i++) {
      time[j] = i;
      float chance = probability*100 / amp.size();
      float x = random(100);
      if ( x < chance) { // probability to szansa na wystapienie na wykresie 1.0, trzeba obliczyc wartosc procentowa a potem skonstruowac if ktory dobrze zbalansuje 1.0 i 0.0
        amp.set(j, 1.0);
      } else {
        amp.set(j, 0.0);
      }
      j++;
    }
  }
}
