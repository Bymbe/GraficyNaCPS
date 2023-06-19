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
    chart4down(S3.time, S3.amp.array()); //czesc urojona
    break;
  }
}

void DFT(float[] sygnalA, float[] sygnalC, int convLength) {
  float[] sygnalB = new float[convLength];
  arrayCopy(sygnalC, sygnalB, convLength);

  int dlugoscA = sygnalA.length;
  int dlugoscB = sygnalB.length;
  int dlugoscWyniku = dlugoscA + dlugoscB - 1; // Długość wynikowej tablicy splotu

  operationSignalAmp = new float[dlugoscWyniku]; // Tablica wynikowa

  //"\n"
  //"$X(k)=\\frac{1}{N}\\displaystyle\\sum_{n=0}^{N-1}x(n)e^{-i\\frac{2\\pi}{N}nk}$\n"
  //"\n"
  //"dla $k=0,1,\\dots,N-1$ i sygnału wejściowego $x(n)$ o liczbie $N$ próbek. Przekształcenie odwrotne definiujemy zgodnie z zależnością:\n"
  //"\n"
  //"$x(n)=\\displaystyle\\sum_{k=0}^{N-1}X(k)e^{i\\frac{2\\pi}{N}nk}$\n"
  //"\n"
  //"dla $n=0,1,\\dots,N-1$. Współczynnik skalujący $1/N$ najczęściej umieszczamy w przekształceniu prostym. Może on jednak pojawić się w definicji przekształcenia odwrotnego, lub w obu wzorach jako $1/\\sqrt{N}$.\n"
  //"\n"
  //"Wynikiem przekształcenia Fouriera jest ciąg liczb zespolonych $X(k)$ dla $k=0,1,\\dots,N-1$. Wynik można predstawić w postaci pary wykresów:\n"
  //"\n"
  //"* wartości rzeczywiste $\\mathrm{Re}\\{X(k)\\}(k)$ i wartości zespolone $\\mathrm{Im}\\{X(k)\\}(k)$,\n"
  //"* moduły liczb zespolonych $\\|X(k)\\|$ i argumenty liczb zespolonych $\\mathrm{arg}\\{X(k)\\}$.\n"

  // Wykonaj splot
  for (int i = 0; i < dlugoscWyniku; i++) {
    operationSignalAmp[i] = 0; // Zeruj wartość dla każdej próbki wynikowej

    for (int j = 0; j < dlugoscA; j++) {
      if (i - j >= 0 && i - j < dlugoscB) {
        // Pomnóż odpowiadające próbki sygnałów A i B oraz dodaj do wyniku
        operationSignalAmp[i] += sygnalA[j] * sygnalB[i - j];
      }
    }
  }
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
