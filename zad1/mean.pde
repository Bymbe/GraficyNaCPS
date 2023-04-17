float meanValue(Signal S) {
  float sum = 0;
  for (int i = 0; i < S.amp.size(); i++) {
    sum += S.amp.get(i);
  }
  return sum / S.amp.size();
}

float absMeanValue(Signal S) {
  float sum = 0;
  for (int i = 0; i < S.amp.size(); i++) {
    sum += abs(S.amp.get(i));
  }
  return sum / S.amp.size();
}

float varianceValue(Signal S) {
  float mean = meanValue(S);
  float sum = 0;
  for (int i = 0; i < S.amp.size(); i++) {
    sum += Math.pow(S.amp.get(i) - mean, 2.0);
  }
  return sum / S.amp.size();
}

float meanPowerValue(Signal S) {
  float sum = 0;
  for (int i = 0; i < S.amp.size(); i++) {
    sum += Math.pow(S.amp.get(i), 2.0);
  }
  return sum / S.amp.size();
}

float rmsValue(Signal S) {
  return sqrt(meanPowerValue(S));
}

void calculateData(Signal S) {
  textAlign(LEFT, CENTER);
  textSize(16);
  text("Średnia: " + nf(meanValue(S), 0, 3), width*0.85, height*0.04);
  text("Średnia bezwzględna: " + nf(absMeanValue(S), 0, 3), width*0.85, height*0.08);
  text("Wariancja: " + nf(varianceValue(S), 0, 3), width*0.85, height*0.12);
  text("Odchylenie: " + nf(rmsValue(S), 0, 3), width*0.85, height*0.16);
  text("Moc średnia: " + nf(meanPowerValue(S), 0, 3), width*0.85, height*0.20);
  if (isReconstructionChartVisible != false) text("Ilosc błędów: " + nf(failuresCounter(S, recAmpl), 0, 3), width*0.85, height*0.24);
  if (isReconstructionChartVisible != false) text("Błąd śr. kw.: " + nf(mse(S, recOnlyValues), 0, 3), width*0.85, height*0.28);
  if (isReconstructionChartVisible != false) text("Stosunek syg-szum: " + nf(snr(S, recOnlyValues), 0, 3), width*0.85, height*0.32);
}

int failuresCounter(Signal S, float[] sigAmpl) {
  int counter = 0;
  try {
    for (int i = 0; i < RECONSTRUCTED_SAMPLE_NUMBER; i++) {
      if (S.amp.get(i) != sigAmpl[i]) counter++;
    }
  }
  catch(Exception e) {
    println("exception e");
  }
  return counter;
}

float mse(Signal S, float[] rec) {
  float mse = 0;
  int x;
  float diff;

  try {
    for (int i = 0; i < RECONSTRUCTED_SAMPLE_NUMBER; i++) {
      x = int(map(i, 0, RECONSTRUCTED_SAMPLE_NUMBER, 0, SAMPLE_NUMBER));
      diff = S.amp.get(x) - rec[i];
      mse += diff * diff;
    }
    mse /= RECONSTRUCTED_SAMPLE_NUMBER;
  }
  catch(Exception e) {
  }

  return mse;
}

float snr(Signal S, float[] rec) {
  float licznik = 0;
  float mianownik = 0;
  float wynik = 0;
  int x;
  float diff;

  try {
    for (int i = 0; i < RECONSTRUCTED_SAMPLE_NUMBER; i++) {
      x = int(map(i, 0, RECONSTRUCTED_SAMPLE_NUMBER, 0, SAMPLE_NUMBER));
      diff = S.amp.get(x) - rec[i];
      licznik += S.amp.get(x) * S.amp.get(x);
      mianownik += diff * diff;
    }
    wynik = licznik/mianownik;
  }
  catch(Exception e) {
  }

  return 10 * (log(wynik) / log(10));
}
