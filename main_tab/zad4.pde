//sygnal zespolony to rzeczywisty z czescia urojona zero
//transformaty robimy na sygnalach zespolonych

// podzial na czesc ur. i rzeczywista ma transformata fouriera. kosinusowa i hadamarda ma po prostu swoj wykres 

void showBothCharts(Signal A) { //<>//
  x = A.amp.array();
  switch(complexChartsType) {
  case 1:
    whichChart4TypeIsVisible = "góra - rzeczywiste, dół - urojone";
    chart4up(A.time, A.amp.array()); //czesc rzeczywista
    chart4down(A.time, DCT(x)); //czesc urojona
    break;
  case 2:
    whichChart4TypeIsVisible = "góra - moduł, dół - argument";
    chart4up(A.time, A.amp.array()); //modul liczby zespolonej z=sqrt(rzeczywista^2 + urojona^2)
    chart4down(A.time, DWHT(x)); //czesc urojona //<>//
    break;
  }
}

float[] DFT(Signal A) {
  operationSignalAmp = new float[SAMPLE_NUMBER]; // Tablica wynikowa

  //for k in range(0, N):
  //if (k==0):
  //ck=1
  //else:
  //ck=math.sqrt(2)
  //  for n in range(0, N):
  //X[k]=X[k]+ck*x[n]*math.cos(math.pi/(2*N)*k*(2*n+1))
  //  return X
  float ck;
  // Wykonaj transformacje
  for (int i = 0; i < SAMPLE_NUMBER; i++) {
    if (i==0)
      ck=1;
    else
      ck=sqrt(2);
    for (int j = 0; i < SAMPLE_NUMBER; i++)
      operationSignalAmp[i] = operationSignalAmp[i] + ck * A.amp.array()[j] * cos(PI/(2*SAMPLE_NUMBER)*i*(2*j+1));
  }
  return operationSignalAmp;
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

float[] DWHT(float[] x) { //<>//
  b(x, 0, x.length); //<>//
  return x; //<>//
}

void b(float[] x, int begin, int end) { //<>//
  int N = end - begin;
  if (N == 1) {
    return;
  }
  for (int i = 0; i < N / 2; i++) {
   // float tmp = x[begin + 1];
    //x[begin + 1] = tmp + x[begin + N / 2 + 1];
   // x[begin + N / 2 + i] = tmp - x[begin + N / 2 + i];
  }
  ////b(x, begin, begin + N / 2);
  ////b(x, being + N / 2, end);
  }
}

float c(int i, int N) {
  if (i == 0) return sqrt(1.0 / N);
  else return sqrt(2.0 / N);
}
