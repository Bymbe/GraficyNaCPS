//sygnal zespolony to rzeczywisty z czescia urojona zero
//transformaty robimy na sygnalach zespolonych

void showBothCharts() {
  switch(complexChartsType) {
  case 1:
    whichChart4TypeIsVisible = "góra - rzeczywiste, dół - urojone";
    chart4up(S3.time, S3.amp.array()); //czesc rzeczywista
    chart4down(S3.time, DCT(S3)); //czesc urojona
    break;
  case 2:
    whichChart4TypeIsVisible = "góra - moduł, dół - argument";
    chart4up(S3.time, S3.amp.array()); //modul liczby zespolonej z=sqrt(rzeczywista^2 + urojona^2)
    chart4down(S3.time, DWHT(S3)); //czesc urojona
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

float[] DCT(Signal A) {
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

float[] DWHT(Signal A) {
  Signal X = A;
  int n, nb, ne;
  float[] AAA = A.amp.array();
  float[] XXX = X.amp.array();
  int p = int(AAA[int(log(2))]);
  int o = int(AAA[int(log(SAMPLE_NUMBER))]);
  int l = p/o;
  n = int(A.amp.array()[l]);
  nb = SAMPLE_NUMBER/2;
  ne = 1;
  float i1, i2, t;
  // Wykonaj transformacje
  for (int i = 0; i < n; i++) {
    for (int j = 0; i < nb; i++) {
      for (int k = 0; i < ne; i++) {
        i1=2*j*ne+k;
        i2=i1+ne;
        t=XXX[int(i1)]+XXX[int(i2)];
        XXX[int(i2)]=XXX[int(i1)]-XXX[int(i2)];
        XXX[int(i1)]=t;
      }
    }
    ne<<=1;
    nb>>=1;
  }
  return XXX;
}
