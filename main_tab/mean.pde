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
  if (numerZadania == 2) {
    if (isReconstructionChartVisible != false) text("Błąd śr. kw.: " + nf(mse(S, recOnlyValues), 0, 3), width*0.85, height*0.28);
    if (isReconstructionChartVisible != false) text("Stosunek syg-szum: " + nf(snr(S, recOnlyValues), 0, 3), width*0.85, height*0.32);
    if (isReconstructionChartVisible != false) text("Szczyt. st. syg-szum: " + nf(psnr(S, recOnlyValues), 0, 3), width*0.85, height*0.36);
    if (isReconstructionChartVisible != false) text("Maksymalna różnica: " + nf(md(S, recOnlyValues), 0, 3), width*0.85, height*0.40);
  }
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
    if (mianownik == 0) mianownik = 1;
    wynik = licznik/mianownik;
  }
  catch(Exception e) {
  }

  return 10 * (log(wynik) / log(10));
}

float psnr(Signal S, float[] rec) {
  float licznik = S.amp.get(0);
  float mianownik = mse(S, rec);
  float wynik = 0;
  int x;

  try {
    for (int i = 0; i < RECONSTRUCTED_SAMPLE_NUMBER; i++) {
      x = int(map(i, 0, RECONSTRUCTED_SAMPLE_NUMBER, 0, SAMPLE_NUMBER));
      if (S.amp.get(x) > licznik) licznik = S.amp.get(x);
    }
    if (mianownik == 0) mianownik = 1;
    wynik = licznik/mianownik;
  }
  catch(Exception e) {
  }

  return 10 * (log(wynik) / log(10));
}

float md(Signal S, float[] rec) {
  float wynik = abs(S.amp.get(0) - rec[0]);
  int x;

  try {
    for (int i = 0; i < RECONSTRUCTED_SAMPLE_NUMBER; i++) {
      x = int(map(i, 0, RECONSTRUCTED_SAMPLE_NUMBER, 0, SAMPLE_NUMBER));
      if (abs(S.amp.get(x) - rec[i]) > wynik) wynik = abs(S.amp.get(x) - rec[i]);
    }
  }
  catch(Exception e) {
  }

  return wynik;
}

void calculate() {
  switch(w1) {
  case 1:
    calc1 = S1.amp.array();
    break;
  case 2:
    calc1 = S2.amp.array();
    break;
  case 3:
    calc1 = S3.amp.array();
    break;
  case 4:
    calc1 = S4.amp.array();
    break;
  case 5:
    calc1 = S5.amp.array();
    break;
  case 6:
    calc1 = S6.amp.array();
    break;
  case 7:
    calc1 = S7.amp.array();
    break;
  case 8:
    calc1 = S8.amp.array();
    break;
  case 9:
    calc1 = S9.amp.array();
    break;
  case 10:
    calc1 = I1.amp.array();
    break;
  case 11:
    calc1 = I2.amp.array();
    break;
  }
  switch(w2) {
  case 1:
    calc2 = S1.amp.array();
    break;
  case 2:
    calc2 = S2.amp.array();
    break;
  case 3:
    calc2 = S3.amp.array();
    break;
  case 4:
    calc2 = S4.amp.array();
    break;
  case 5:
    calc2 = S5.amp.array();
    break;
  case 6:
    calc2 = S6.amp.array();
    break;
  case 7:
    calc2 = S7.amp.array();
    break;
  case 8:
    calc2 = S8.amp.array();
    break;
  case 9:
    calc2 = S9.amp.array();
    break;
  case 10:
    calc2 = I1.amp.array();
    break;
  case 11:
    calc2 = I2.amp.array();
    break;
  }
  try {
    switch(operacjaString) {
    case "+":
      for (int i=0; i < calc1.length; i++) {
        calcTime[i] = S1.time[i];
        calcResult[i] = calc1[i] + calc2[i];
      }
      break;
    case "-":
      for (int i=0; i < calc1.length; i++) {
        calcTime[i] = S1.time[i];
        calcResult[i] = calc1[i] - calc2[i];
      }
      break;
    case "*":
      for (int i=0; i < calc1.length; i++) {
        calcTime[i] = S1.time[i];
        calcResult[i] = calc1[i] * calc2[i];
      }
      break;
    case "/":
      for (int i=0; i < calc1.length; i++) {
        calcTime[i] = S1.time[i];
        if (calc2[i] != 0) calcResult[i] = calc1[i] / calc2[i];
        else calcResult[i] = USER_AMPLITUDE * 5;
      }
      break;
    }
  }
  catch (Exception e) {
    println("ups");
  }
  S0 = new Signal(0, 10, calcTime, calcResult, S1.ampl);
}
