//sygnal zespolony to rzeczywisty z czescia urojona zero //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
//transformaty robimy na sygnalach zespolonych

// podzial na czesc ur. i rzeczywista ma transformata fouriera. kosinusowa i hadamarda ma po prostu swoj wykres

void showBothCharts(Signal A) {
  x = A.amp.array();
  Complex[] y = DFT(x);
  float[] Cx = new float[SAMPLE_NUMBER];
  float[] Cy = new float[SAMPLE_NUMBER];
  for (int i = 0; i < SAMPLE_NUMBER; i++) {
    Cx[i] = y[i].getReal();
    Cy[i] = y[i].getImag(); 
  }
  switch(complexChartsType) {
  case 1:
    whichChart4TypeIsVisible = "góra - rzeczywiste, dół - urojone";
    chart4up(A.time, Cx); //czesc rzeczywista
    chart4down(A.time, Cy); //czesc urojona
    break;
  case 2:
    whichChart4TypeIsVisible = "góra - moduł, dół - argument";
    chart4up(A.time, A.amp.array()); //modul liczby zespolonej z=sqrt(rzeczywista^2 + urojona^2)
    chart4down(A.time, DCT(x)); //czesc urojona
    break;
  }
}

Complex[] DFT(float[] x) {
  int N = x.length;
  float Warg = 2.0 * PI / N;
  Complex W = new Complex(cos(Warg), sin(Warg));
  Complex[] X = new Complex[N];
  for (int i = 0; i < N; i++) {
    Complex sum = new Complex(0.0);
    for (int j = 0; i < N; j++) sum = sum.add(x[j].multiply(W.pow(-i*j)));
    X[i] = sum.divides(N);
  }
  return X;
}

float[] DCT(float[] x) {
  int N = x.length;
  float[] X = new float[N];
  for (int i = 0; i < N; i++) {
    float sum = 0.0;
    for (int j = 0; j < N; j++)
      sum += x[j] * cos(PI * (2.0 * j + 1) * i / (2.0 * N));
    X[i] = c(i, N) * sum;
  }
  return X;
}

float[] DWHT(float[] x) {
  b(x, 0, x.length);
  return x;
}

void b(float[] x, int begin, int end) {
  int N = end - begin;
  if (N == 1) {
    return;
  }
  for (int i = 0; i < N / 2; i++) {
    float tmp = x[begin + i];
    x[begin + i] = tmp + x[begin + N / 2 + i];
    x[begin + N / 2 + i] = tmp - x[begin + N / 2 + i];
  }
  b(x, begin, begin + N / 2);
  b(x, begin + N / 2, end);
}

float c(int i, int N) {
  if (i == 0) return sqrt(1.0 / N);
  else return sqrt(2.0 / N);
}
