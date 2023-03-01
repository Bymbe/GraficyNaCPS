class Szum { //szum
  float poczatek_S; // poczatek szumu
  float koniec_S; // koniec szumu
  float srednia;
  float odchylenie;
  float[] amplituda = new float[1000];
  float[] czas = new float[1000];

  public Szum(float poczatekSzumu, float koniecSzumu, float srednia0, float odchylenie1) { //konstruktor
    poczatek_S = poczatekSzumu;
    koniec_S = koniecSzumu;
    srednia = srednia0;
    odchylenie = odchylenie1;
  }
}

class Gauss extends Szum { //szum gaussa
  public Gauss(float poczatekSzumu, float koniecSzumu, float srednia0, float odchylenie1) {
    super(poczatekSzumu, koniecSzumu, srednia0, odchylenie1);
  }
  public void calculate() {
    int j = 0;
    for (float i = poczatek_S; i<=koniec_S; i+= (koniec_S-poczatek_S)*0.01) {
      float pierwsze = 1/(odchylenie*sqrt(TWO_PI));
      float trzecie = (-1*pow((i-srednia), 2))/(2*pow(odchylenie, 2));
      float drugie = pow(exp(1.0), trzecie);
      amplituda[j] = pierwsze*drugie;
      czas[j] = i;
      j++;
    }
  }
}

class ContinuosSignal extends Szum {
  public ContinuosSignal(float poczatekSzumu, float koniecSzumu, float srednia0, float odchylenie1) {
        super(poczatekSzumu, koniecSzumu, srednia0, odchylenie1);
  }
}
