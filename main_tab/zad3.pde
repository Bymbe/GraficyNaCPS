void showConvolution() {
  switch(convSignalChoice1) {
  case 1:
    tempPreConvSignal1 = new float[S1.amp.array().length];
    arrayCopy(S1.amp.array(), tempPreConvSignal1);
    break;
  case 2:
    tempPreConvSignal1 = new float[S2.amp.array().length];
    arrayCopy(S2.amp.array(), tempPreConvSignal1);
    break;
  case 3:
    tempPreConvSignal1 = new float[S3.amp.array().length];
    arrayCopy(S3.amp.array(), tempPreConvSignal1);
    break;
  case 4:
    tempPreConvSignal1 = new float[S4.amp.array().length];
    arrayCopy(S4.amp.array(), tempPreConvSignal1);
    break;
  case 5:
    tempPreConvSignal1 = new float[S5.amp.array().length];
    arrayCopy(S5.amp.array(), tempPreConvSignal1);
    break;
  case 6:
    tempPreConvSignal1 = new float[S6.amp.array().length];
    arrayCopy(S6.amp.array(), tempPreConvSignal1);
    break;
  case 7:
    tempPreConvSignal1 = new float[S7.amp.array().length];
    arrayCopy(S7.amp.array(), tempPreConvSignal1);
    break;
  case 8:
    tempPreConvSignal1 = new float[S8.amp.array().length];
    arrayCopy(S8.amp.array(), tempPreConvSignal1);
    break;
  case 9:
    tempPreConvSignal1 = new float[S9.amp.array().length];
    arrayCopy(S9.amp.array(), tempPreConvSignal1);
    break;
  }

  switch(convSignalChoice2) {
  case 1:
    tempPreConvSignal1 = new float[S1.amp.array().length];
    arrayCopy(S1.amp.array(), tempPreConvSignal2);
    break;
  case 2:
    tempPreConvSignal1 = new float[S2.amp.array().length];
    arrayCopy(S2.amp.array(), tempPreConvSignal2);
    break;
  case 3:
    tempPreConvSignal2 = new float[S3.amp.array().length];
    arrayCopy(S3.amp.array(), tempPreConvSignal2);
    break;
  case 4:
    tempPreConvSignal2 = new float[S4.amp.array().length];
    arrayCopy(S4.amp.array(), tempPreConvSignal2);
    break;
  case 5:
    tempPreConvSignal2 = new float[S5.amp.array().length];
    arrayCopy(S5.amp.array(), tempPreConvSignal2);
    break;
  case 6:
    tempPreConvSignal2 = new float[S6.amp.array().length];
    arrayCopy(S6.amp.array(), tempPreConvSignal2);
    break;
  case 7:
    tempPreConvSignal2 = new float[S7.amp.array().length];
    arrayCopy(S7.amp.array(), tempPreConvSignal2);
    break;
  case 8:
    tempPreConvSignal2 = new float[S8.amp.array().length];
    arrayCopy(S8.amp.array(), tempPreConvSignal2);
    break;
  case 9:
    tempPreConvSignal2 = new float[S9.amp.array().length];
    arrayCopy(S9.amp.array(), tempPreConvSignal2);
    break;
  }

  convolution(tempPreConvSignal1, tempPreConvSignal2);
  chart(convSignalTime, convSignalAmp);
}

void convolution(float[] sygnalA, float[] sygnalB) {
  int dlugoscA = sygnalA.length;
  int dlugoscB = sygnalB.length;
  int dlugoscWyniku = dlugoscA + dlugoscB - 1; // Długość wynikowej tablicy splotu

  convSignalAmp = new float[dlugoscWyniku]; // Tablica wynikowa

  // Wykonaj splot
  for (int i = 0; i < dlugoscWyniku; i++) {
    convSignalAmp[i] = 0; // Zeruj wartość dla każdej próbki wynikowej

    for (int j = 0; j < dlugoscA; j++) {
      if (i - j >= 0 && i - j < dlugoscB) {
        // Pomnóż odpowiadające próbki sygnałów A i B oraz dodaj do wyniku
        convSignalAmp[i] += sygnalA[j] * sygnalB[i - j];
      }
    }
  }

  convSignalTime = new float[dlugoscWyniku];
  for (int i = 0; i<dlugoscWyniku; i++) {
    convSignalTime[i] = map(i, 0, dlugoscWyniku, 0, SIGNAL_END);
  }
}
