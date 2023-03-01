class S2 { //szum gaussa
  private float poczatek_S;
  private float koniec_S;
  private float srednia;
  private float odchylenie;
  private float[] amplituda = new float[1000];
  private float[] czas = new float[1000];

  public S2(float poczatekSzumu, float koniecSzumu, float srednia0, float odchylenie1) {
    poczatek_S = poczatekSzumu;
    koniec_S = koniecSzumu;
    srednia = srednia0;
    odchylenie = odchylenie1;
  }
  
  public void calculate() {
    int j = 0;
    for(float i = poczatek_S; i<=koniec_S; i+= (koniec_S-poczatek_S)*0.01) {
      
      float pierwsze = 1/(odchylenie*sqrt(TWO_PI));
      float trzecie = (-1*pow((i-srednia), 2))/(2*pow(odchylenie,2));
      float drugie = pow(exp(1.0), trzecie);
      
      amplituda[j] = pierwsze*drugie;

      czas[j] = i;
      j++;
    }
  }
}
