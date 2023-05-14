void showOperation() {
  switch(operationSignalChoice1) {
  case 1:
    tempOperationSignal1 = new float[S1.amp.array().length];
    arrayCopy(S1.amp.array(), tempOperationSignal1);
    break;
  case 2:
    tempOperationSignal1 = new float[S2.amp.array().length];
    arrayCopy(S2.amp.array(), tempOperationSignal1);
    break;
  case 3:
    tempOperationSignal1 = new float[S3.amp.array().length];
    arrayCopy(S3.amp.array(), tempOperationSignal1);
    break;
  case 4:
    tempOperationSignal1 = new float[S4.amp.array().length];
    arrayCopy(S4.amp.array(), tempOperationSignal1);
    break;
  case 5:
    tempOperationSignal1 = new float[S5.amp.array().length];
    arrayCopy(S5.amp.array(), tempOperationSignal1);
    break;
  case 6:
    tempOperationSignal1 = new float[S6.amp.array().length];
    arrayCopy(S6.amp.array(), tempOperationSignal1);
    break;
  case 7:
    tempOperationSignal1 = new float[S7.amp.array().length];
    arrayCopy(S7.amp.array(), tempOperationSignal1);
    break;
  case 8:
    tempOperationSignal1 = new float[S8.amp.array().length];
    arrayCopy(S8.amp.array(), tempOperationSignal1);
    break;
  case 9:
    tempOperationSignal1 = new float[S9.amp.array().length];
    arrayCopy(S9.amp.array(), tempOperationSignal1);
    break;
  }

  switch(operationSignalChoice2) {
  case 1:
    tempOperationSignal1 = new float[S1.amp.array().length];
    arrayCopy(S1.amp.array(), tempOperationSignal2);
    break;
  case 2:
    tempOperationSignal1 = new float[S2.amp.array().length];
    arrayCopy(S2.amp.array(), tempOperationSignal2);
    break;
  case 3:
    tempOperationSignal2 = new float[S3.amp.array().length];
    arrayCopy(S3.amp.array(), tempOperationSignal2);
    break;
  case 4:
    tempOperationSignal2 = new float[S4.amp.array().length];
    arrayCopy(S4.amp.array(), tempOperationSignal2);
    break;
  case 5:
    tempOperationSignal2 = new float[S5.amp.array().length];
    arrayCopy(S5.amp.array(), tempOperationSignal2);
    break;
  case 6:
    tempOperationSignal2 = new float[S6.amp.array().length];
    arrayCopy(S6.amp.array(), tempOperationSignal2);
    break;
  case 7:
    tempOperationSignal2 = new float[S7.amp.array().length];
    arrayCopy(S7.amp.array(), tempOperationSignal2);
    break;
  case 8:
    tempOperationSignal2 = new float[S8.amp.array().length];
    arrayCopy(S8.amp.array(), tempOperationSignal2);
    break;
  case 9:
    tempOperationSignal2 = new float[S9.amp.array().length];
    arrayCopy(S9.amp.array(), tempOperationSignal2);
    break;
  }

  switch(whichIsVisible) {
  case 1:
    convolution(tempOperationSignal1, tempOperationSignal2);
    chart(operationSignalTime, operationSignalAmp);
    break;
  case 2:
    convolution(tempOperationSignal1, filtracja(filterPassChoice, filterWindowChoice), parametrM);
    chart(operationSignalTime, operationSignalAmp);
    if (isOptionalFilterVisible) chart2(makeXaxisValues(filtracja(filterPassChoice, filterWindowChoice)), filtracja(filterPassChoice, filterWindowChoice));
    break;
  case 3:
    corelation(tempOperationSignal1, tempOperationSignal2);
    chart(operationSignalTime, operationSignalAmp);
    break;
  default:
    break;
  }
}

void convolution(float[] sygnalA, float[] sygnalC) {
  float[] sygnalB = new float[convSignal2SampleNumber];
  arrayCopy(sygnalC, sygnalB, convSignal2SampleNumber);

  int dlugoscA = sygnalA.length;
  int dlugoscB = sygnalB.length;
  int dlugoscWyniku = dlugoscA + dlugoscB - 1; // Długość wynikowej tablicy splotu

  operationSignalAmp = new float[dlugoscWyniku]; // Tablica wynikowa

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

  operationSignalTime = new float[dlugoscWyniku];
  for (int i = 0; i<dlugoscWyniku; i++) {
    operationSignalTime[i] = map(i, 0, dlugoscWyniku, 0, SIGNAL_END);
  }
}

void convolution(float[] sygnalA, float[] sygnalC, int convLength) {
  float[] sygnalB = new float[convLength];
  arrayCopy(sygnalC, sygnalB, convLength);

  int dlugoscA = sygnalA.length;
  int dlugoscB = sygnalB.length;
  int dlugoscWyniku = dlugoscA + dlugoscB - 1; // Długość wynikowej tablicy splotu

  operationSignalAmp = new float[dlugoscWyniku]; // Tablica wynikowa

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

  operationSignalTime = new float[dlugoscWyniku];
  for (int i = 0; i<dlugoscWyniku; i++) {
    operationSignalTime[i] = map(i, 0, dlugoscWyniku, 0, SIGNAL_END);
  }
}

void corelation(float[] sygnalA, float[] sygnalC) {
  float[] sygnalB = new float[convSignal2SampleNumber];
  arrayCopy(sygnalC, sygnalB, convSignal2SampleNumber);

  int dlugoscA = sygnalA.length;
  int dlugoscB = sygnalB.length;
  int dlugoscWyniku = dlugoscA + dlugoscB - 1;

  operationSignalAmp = new float[dlugoscWyniku];

  // Wykonaj splot
  for (int i = 0; i < dlugoscWyniku; i++) {
    operationSignalAmp[i] = 0;
    for (int j = 0; j < dlugoscA; j++) {
      if (i - j >= 0 && i - j < dlugoscB) {
        if (i - j + delayCorelationNumber < dlugoscB) operationSignalAmp[i] += sygnalA[j] * sygnalB[i - j + delayCorelationNumber];
        else operationSignalAmp[i] += sygnalA[j] * sygnalB[i - j + delayCorelationNumber - dlugoscB];
      }
    }
  }

  operationSignalTime = new float[dlugoscWyniku];
  for (int i = 0; i<dlugoscWyniku; i++) {
    operationSignalTime[i] = map(i, 0, dlugoscWyniku, 0, SIGNAL_END);
  }
}

float[] filtracja(int whichPass, int whichWindow) {
  float wynik[] = new float[parametrM];

  for (int i = 0; i<parametrM; i++) {

    if (i == (parametrM-1)/2) {
      wynik[i]= 2/float(parametrK); // jezeli dolno
      if (whichPass == 2) wynik[i] = wynik[i] * 2.0 * (sin(PI * i / 2.0));//jezeli srodkowo
      if (whichPass == 3) wynik[i] = wynik[i] * ((i & 0x01) == 1 ? -1.0 : 1.0);// jezeli gorno
    } else {
      wynik[i] = (sin(TWO_PI*(i-(parametrM-1)/2)/parametrK) / (PI*(i-(parametrM-1)/2)));
      if (whichPass == 2) wynik[i] = wynik[i] * 2.0 * (sin(PI * i / 2.0));//jezeli srodkowo
      if (whichPass == 3) wynik[i] = wynik[i] * ((i & 0x01) == 1 ? -1.0 : 1.0);
    }
    if (whichWindow == 2) { //okno Hamminga
      wynik[i] *= (0.53836-0.46164*cos(TWO_PI*i/parametrM));
    }
    if (whichWindow == 3) { //okno Hanninga
      wynik[i] *= (0.5-0.5*cos(TWO_PI*i/parametrM));
    }
    if (whichWindow == 4) { //okno Blackmana *vine boom*
      wynik[i] *= (0.42-0.5*cos(TWO_PI*i/parametrM)+0.08*cos(2*TWO_PI*i/parametrM));
    }
  }
  return wynik;
}

float[] makeXaxisValues(float[] axisY) {
  float[] wynik = new float[axisY.length];

  for (int i=0; i<axisY.length; i++) {
    wynik[i] = map(i, 0, axisY.length, 0, SIGNAL_END);
  }

  return wynik;
}
