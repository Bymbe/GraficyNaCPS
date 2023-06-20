//sygnal zespolony to rzeczywisty z czescia urojona zero //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
//transformaty robimy na sygnalach zespolonych

// podzial na czesc ur. i rzeczywista ma transformata fouriera. kosinusowa i hadamarda ma po prostu swoj wykres

void showBothCharts(Signal A) {
  x = A.amp.array();
  x0 = new float[x.length];

  ArrayList<Complex> y = new ArrayList<Complex>();
  for (int i = 0; i < x.length; ++i) {
    y.add(new Complex());
    x0[i] = 0.0;
  }
  // y.get(0).setRe(0);
  //y.get(0).setIm(5);
  //println(y.get(0).re(), y.get(0).im());
  Complex[] temp;
  //Complex[] y = DFT(temp);
  float[] Cx = new float[SAMPLE_NUMBER];
  float[] Cy = new float[SAMPLE_NUMBER];
  for (int i = 0; i < SAMPLE_NUMBER; i++) {
    //Cx[i] = (float)y[i].re();
    //Cy[i] = (float)y[i].im();
  }

  switch(transformation4Type) {
  case 1:
    transformationTimeStart = millis();
    Complexx[] fftResult = fft(x, x0);
    transformationTime = millis() - transformationTimeStart;
    signalRE = new float[x.length];
    signalIM = new float[x.length];
    signalMOD = new float[x.length];
    signalARG = new float[x.length];

    for (int i=0; i<x.length; i++) {
      signalRE[i] = fftResult[i].real;
      signalIM[i] = fftResult[i].imaginary;
      signalMOD[i] = sqrt(signalRE[i]*signalRE[i] + signalIM[i]*signalIM[i]);
      signalARG[i] = atan2(signalIM[i], signalRE[i]);
    }
    //signalRE[0] = 0;

    if (complexChartsType == 1) {
      chart4up(A.time, signalRE);
      chart4down(A.time, signalIM);
    } else {
      chart4up(A.time, signalMOD);
      chart4down(A.time, signalARG);
    }
    break;
  case 2:
    chart4up(A.time, A.amp.array());
    chart4down(A.time, DCT(x));

    break;
  case 3:
    chart4up(A.time, A.amp.array());
    chart4down(A.time, DWHT(x));
    break;
  }
}






class Complexx {
  float real;
  float imaginary;

  Complexx(float real, float imaginary) {
    this.real = real;
    this.imaginary = imaginary;
  }
}

Complexx[] fft(float[] inputReal, float[] inputImaginary) {
  int N = inputReal.length;

  if (N <= 1) {
    Complexx[] result = new Complexx[1];
    result[0] = new Complexx(inputReal[0], inputImaginary[0]);
    return result;
  }

  float[] evenReal = new float[N / 2];
  float[] evenImaginary = new float[N / 2];
  float[] oddReal = new float[N / 2];
  float[] oddImaginary = new float[N / 2];

  for (int i = 0; i < N / 2; i++) {
    evenReal[i] = inputReal[2 * i];
    evenImaginary[i] = inputImaginary[2 * i];
    oddReal[i] = inputReal[2 * i + 1];
    oddImaginary[i] = inputImaginary[2 * i + 1];
  }

  Complexx[] evenTransformed = fft(evenReal, evenImaginary);
  Complexx[] oddTransformed = fft(oddReal, oddImaginary);

  Complexx[] outputSignal = new Complexx[N];

  for (int k = 0; k < N / 2; k++) {
    float angle = -2 * PI * k / N;
    float complexMultiplierReal = cos(angle);
    float complexMultiplierImaginary = sin(angle);

    Complexx oddTerm = new Complexx(
      oddTransformed[k].real * complexMultiplierReal - oddTransformed[k].imaginary * complexMultiplierImaginary,
      oddTransformed[k].real * complexMultiplierImaginary + oddTransformed[k].imaginary * complexMultiplierReal
      );

    outputSignal[k] = new Complexx(
      evenTransformed[k].real + oddTerm.real,
      evenTransformed[k].imaginary + oddTerm.imaginary
      );
    outputSignal[k + N / 2] = new Complexx(
      evenTransformed[k].real - oddTerm.real,
      evenTransformed[k].imaginary - oddTerm.imaginary
      );
  }

  return outputSignal;
}





Complex[] DFT(Complex[] x) {

  int N = x.length;
  float Warg = 2.0 * PI / N;
  Complex W = new Complex(cos(Warg), sin(Warg));
  Complex[] X = new Complex[N];
  for (int i = 0; i < N; i++) {
    Complex sum = new Complex(0.0);
    //for (int j = 0; i < N; j++) sum = sum.add(x[j].mul(W.pow(-i*j)));
    X[i] = sum.div(N);
  }

  //float[] wynikRe = new float[x.length];
  //for(int i=0; i<x.length; i++) {
  //  wynikRe[i] = (float)X[i].re();
  //}
  return X;
}

float[] DCT(float[] x) {
  transformationTimeStart = millis();
  int N = x.length;
  float[] X = new float[N];
  for (int i = 0; i < N; i++) {
    float sum = 0.0;
    for (int j = 0; j < N; j++)
      sum += x[j] * cos(PI * (2.0 * j + 1) * i / (2.0 * N));
    X[i] = c(i, N) * sum;
  }
  transformationTime = millis() - transformationTimeStart;
  return X;
}

float[] DWHT(float[] x) {
  transformationTimeStart = millis();
  b(x, 0, x.length);
  transformationTime = millis() - transformationTimeStart;
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
