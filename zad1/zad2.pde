void showSelectedReconstruction(float[] xaxis, float[] yaxis) {
  switch(reconstructionChoice) {
  case 1:
    sampling(yaxis);
    bar(recAmpl);
    break;
  case 2:
    quantizationCut(xaxis, yaxis);
    reconstructed(recTime, recAmpl);
    break;
  case 3:
    quantizationMean(xaxis, yaxis);
    reconstructed(recTime, recAmpl);
    break;
  case 4:
    reconstructedSignalZeroOrderHold(xaxis, yaxis);
    reconstructed(recTime, recAmpl);
    break;
  case 5:
    reconstructedSignalFirstOrderHold(xaxis, yaxis);
    reconstructed(recTime, recAmpl);
    break;
  case 6:
    reconstructedSignalSincBasic(xaxis, yaxis);
    reconstructed(recTime, recAmpl);
    break;
  }
  if (reconstructionChoice == 1) {
    showBarChart = true;
    showLineChart = false;
  } else {
    showBarChart = false;
    showLineChart = true;
  }
}

void sampling(float[] sigAmpl) {
  float newAmpl[] = new float[RECONSTRUCTED_SAMPLE_NUMBER+1];
  float newAmplFinal[] = new float[RECONSTRUCTED_SAMPLE_NUMBER];
  int x = 0;
  for (int i = 0; i < RECONSTRUCTED_SAMPLE_NUMBER; i++) {
    x = int(map(i, 0, RECONSTRUCTED_SAMPLE_NUMBER, 0, SAMPLE_NUMBER));
    if (x == SAMPLE_NUMBER) x = SAMPLE_NUMBER-1;
    newAmpl[i] = sigAmpl[x];
  }
  for (int i = 0; i <RECONSTRUCTED_SAMPLE_NUMBER; i++) {
    newAmplFinal[i] = (newAmpl[i] + newAmpl[i+1])/2;
  }
  recAmpl = new float[RECONSTRUCTED_SAMPLE_NUMBER];
  arrayCopy(newAmplFinal, recAmpl);
}

void quantizationCut(float[] sigTime, float[] sigAmpl) {
  float newTime[] = new float[RECONSTRUCTED_SAMPLE_NUMBER+1];
  float newAmpl[] = new float[RECONSTRUCTED_SAMPLE_NUMBER+1];
  int x = 0;
  for (int i = 0; i <= RECONSTRUCTED_SAMPLE_NUMBER; i++) {
    x = int(map(i, 0, RECONSTRUCTED_SAMPLE_NUMBER, 0, SAMPLE_NUMBER));
    if (x == SAMPLE_NUMBER) x = SAMPLE_NUMBER-1;
    newAmpl[i] = sigAmpl[x] - sigAmpl[x]%QUANTIZATION_JUMP_SIZE; //tutaj gdyby to bylo tylko probkowanie to wystarczyloby bez odejmowania modulo
    if (sigAmpl[x] < 0) newAmpl[i] = sigAmpl[x] - sigAmpl[x]%QUANTIZATION_JUMP_SIZE - QUANTIZATION_JUMP_SIZE;
    newTime[i] = sigTime[x];
  } //basically probkowanie... chyba...
  float newTimeDoubled[] = new float[(RECONSTRUCTED_SAMPLE_NUMBER*2)+1];
  newTimeDoubled[0] = newTime[0];
  float newAmplDoubled[] = new float[(RECONSTRUCTED_SAMPLE_NUMBER*2)+1];
  newAmplDoubled[0] = newAmpl[0];
  for (int i = 1; i <=RECONSTRUCTED_SAMPLE_NUMBER; i++) { //by ladnie sie pokazywalo
    if (newAmpl[i] < newAmpl[i-1]) {
      //linia na wykresie idzie w dol, dopiero potem w prawo
      newAmplDoubled[(i*2)-1] = newAmpl[i];
      newTimeDoubled[(i*2)-1] = newTime[i-1];
    } else {
      newAmplDoubled[(i*2)-1] = newAmpl[i-1];
      newTimeDoubled[(i*2)-1] = newTime[i];
    }
    newAmplDoubled[(i*2)] = newAmpl[i];
    newTimeDoubled[(i*2)] = newTime[i];
  }
  recTime = new float[(RECONSTRUCTED_SAMPLE_NUMBER*2)+1];
  recAmpl = new float[(RECONSTRUCTED_SAMPLE_NUMBER*2)+1];
  arrayCopy(newTimeDoubled, recTime);
  arrayCopy(newAmplDoubled, recAmpl);
}

void quantizationMean(float[] sigTime, float[] sigAmpl) {
  float newTime[] = new float[RECONSTRUCTED_SAMPLE_NUMBER+1];
  float newAmpl[] = new float[RECONSTRUCTED_SAMPLE_NUMBER+1];
  int x = 0;
  for (int i = 0; i <= RECONSTRUCTED_SAMPLE_NUMBER; i++) {
    x = int(map(i, 0, RECONSTRUCTED_SAMPLE_NUMBER, 0, SAMPLE_NUMBER));
    if (x == SAMPLE_NUMBER) x = SAMPLE_NUMBER-1;
    //newAmpl[i] = sigAmpl[x] - sigAmpl[x]%QUANTIZATION_JUMP_SIZE; //tutaj gdyby to bylo tylko probkowanie to wystarczyloby bez odejmowania modulo
    if (sigAmpl[x]>=0) {
      if (sigAmpl[x]%QUANTIZATION_JUMP_SIZE > QUANTIZATION_JUMP_SIZE/2) {
        newAmpl[i] = sigAmpl[x] - sigAmpl[x]%QUANTIZATION_JUMP_SIZE + QUANTIZATION_JUMP_SIZE;
      } else newAmpl[i] = sigAmpl[x] - sigAmpl[x]%QUANTIZATION_JUMP_SIZE;
    } else {
      if (sigAmpl[x]%QUANTIZATION_JUMP_SIZE > QUANTIZATION_JUMP_SIZE/2) {
        newAmpl[i] = sigAmpl[x] - sigAmpl[x]%QUANTIZATION_JUMP_SIZE + QUANTIZATION_JUMP_SIZE;
      } else newAmpl[i] = sigAmpl[x] - sigAmpl[x]%QUANTIZATION_JUMP_SIZE;
    }
    newTime[i] = sigTime[x];
  } //basically probkowanie... chyba...
  float newTimeDoubled[] = new float[(RECONSTRUCTED_SAMPLE_NUMBER*2)+1];
  newTimeDoubled[0] = newTime[0];
  float newAmplDoubled[] = new float[(RECONSTRUCTED_SAMPLE_NUMBER*2)+1];
  newAmplDoubled[0] = newAmpl[0];
  for (int i = 1; i <=RECONSTRUCTED_SAMPLE_NUMBER; i++) { //by ladnie sie pokazywalo
    if (newAmpl[i] < newAmpl[i-1]) {
      //linia na wykresie idzie w dol, dopiero potem w prawo
      newAmplDoubled[(i*2)-1] = newAmpl[i];
      newTimeDoubled[(i*2)-1] = newTime[i-1];
    } else {
      newAmplDoubled[(i*2)-1] = newAmpl[i-1];
      newTimeDoubled[(i*2)-1] = newTime[i];
    }
    newAmplDoubled[(i*2)] = newAmpl[i];
    newTimeDoubled[(i*2)] = newTime[i];
  }
  recTime = new float[(RECONSTRUCTED_SAMPLE_NUMBER*2)+1];
  recAmpl = new float[(RECONSTRUCTED_SAMPLE_NUMBER*2)+1];
  arrayCopy(newTimeDoubled, recTime);
  arrayCopy(newAmplDoubled, recAmpl);
}

void reconstructedSignalZeroOrderHold(float[] sigTime, float[] sigAmpl) {
  float newTime[] = new float[RECONSTRUCTED_SAMPLE_NUMBER+1];
  float newAmpl[] = new float[RECONSTRUCTED_SAMPLE_NUMBER+1];
  int x = 0;
  for (int i = 0; i <= RECONSTRUCTED_SAMPLE_NUMBER; i++) {
    x = int(map(i, 0, RECONSTRUCTED_SAMPLE_NUMBER, 0, SAMPLE_NUMBER));
    if (x == SAMPLE_NUMBER) x = SAMPLE_NUMBER-1;
    newAmpl[i] = sigAmpl[x];
    newTime[i] = sigTime[x];
  }
  float newTimeDoubled[] = new float[(RECONSTRUCTED_SAMPLE_NUMBER*2)+1];
  newTimeDoubled[0] = newTime[0];
  float newAmplDoubled[] = new float[(RECONSTRUCTED_SAMPLE_NUMBER*2)+1];
  newAmplDoubled[0] = newAmpl[0];
  for (int i = 1; i <=RECONSTRUCTED_SAMPLE_NUMBER; i++) { //by ladnie sie pokazywalo
    if (newAmpl[i] < newAmpl[i-1]) {
      newAmplDoubled[(i*2)-1] = newAmpl[i];
      newTimeDoubled[(i*2)-1] = newTime[i-1];
    } else {
      newAmplDoubled[(i*2)-1] = newAmpl[i-1];
      newTimeDoubled[(i*2)-1] = newTime[i];
    }
    newAmplDoubled[(i*2)] = newAmpl[i];
    newTimeDoubled[(i*2)] = newTime[i];
  }
  recTime = new float[(RECONSTRUCTED_SAMPLE_NUMBER*2)+1];
  recAmpl = new float[(RECONSTRUCTED_SAMPLE_NUMBER*2)+1];
  arrayCopy(newTimeDoubled, recTime);
  arrayCopy(newAmplDoubled, recAmpl);
}

void reconstructedSignalFirstOrderHold(float[] sigTime, float[] sigAmpl) {
  float newTime[] = new float[RECONSTRUCTED_SAMPLE_NUMBER+1];
  float newAmpl[] = new float[RECONSTRUCTED_SAMPLE_NUMBER+1];
  int x = 0;
  for (int i = 0; i <= RECONSTRUCTED_SAMPLE_NUMBER; i++) {
    x = int(map(i, 0, RECONSTRUCTED_SAMPLE_NUMBER, 0, SAMPLE_NUMBER));
    if (x == SAMPLE_NUMBER) x = SAMPLE_NUMBER-1;
    newTime[i] = sigTime[x];
    if (i != 0) {
      if (i == 1)
        newAmpl[i] = findReconstructedPoint(sigAmpl[x], sigAmpl[x - 1], newTime[i / (SAMPLE_NUMBER / RECONSTRUCTED_SAMPLE_NUMBER)], newTime[i / (SAMPLE_NUMBER / RECONSTRUCTED_SAMPLE_NUMBER)] - 2); // z tych dwoch punktow ukladamy wzor funkcji oraz obliczamy a i b ktore sa punktami ktore trzeba wlozyc w rekonstruowany sygnal
      else
        newAmpl[i] = findReconstructedPoint(sigAmpl[x - 1], sigAmpl[x - 2], newTime[i / (SAMPLE_NUMBER / RECONSTRUCTED_SAMPLE_NUMBER)] - 1, newTime[i / (SAMPLE_NUMBER / RECONSTRUCTED_SAMPLE_NUMBER)] - 2); // z tych dwoch punktow ukladamy wzor funkcji oraz obliczamy a i b ktore sa punktami ktore trzeba wlozyc w rekonstruowany sygnal
    } else {
      newAmpl[i] =  sigAmpl[x];
    }
    newAmpl[i] = sigAmpl[x];
  }
  float newTimeDoubled[] = new float[(RECONSTRUCTED_SAMPLE_NUMBER)+1];
  newTimeDoubled[0] = newTime[0];
  float newAmplDoubled[] = new float[(RECONSTRUCTED_SAMPLE_NUMBER)+1];
  newAmplDoubled[0] = newAmpl[0];
  for (int i = 1; i <=RECONSTRUCTED_SAMPLE_NUMBER; i++) {
    if (newAmpl[i] < newAmpl[i-1]) {
      newAmplDoubled[(i)-1] = newAmpl[i];
      newTimeDoubled[(i)-1] = newTime[i-1];
    } else {
      newAmplDoubled[(i)-1] = newAmpl[i-1];
      newTimeDoubled[(i)-1] = newTime[i];
    }
    newAmplDoubled[(i)] = newAmpl[i];
    newTimeDoubled[(i)] = newTime[i];
  }
  newTimeDoubled[0] = sigTime[0];
  recTime = new float[(RECONSTRUCTED_SAMPLE_NUMBER)+1];
  recAmpl = new float[(RECONSTRUCTED_SAMPLE_NUMBER)+1];
  arrayCopy(newTimeDoubled, recTime);
  arrayCopy(newAmplDoubled, recAmpl);
}

float findReconstructedPoint(float Y1, float Y2, float X1, float X2) {
  float point = Y2 + (X1 - X2) * (Y1 - Y2) / (X1 - X2);
  return point;
}

void reconstructedSignalSincBasic(float[] sigTime, float[] sigAmpl) {
  float newTime[] = new float[RECONSTRUCTED_SAMPLE_NUMBER+1];
  float newAmpl[] = new float[RECONSTRUCTED_SAMPLE_NUMBER+1];
  int x = 0;
  for (int i = 0; i <= RECONSTRUCTED_SAMPLE_NUMBER; i++) {
    x = int(map(i, 0, RECONSTRUCTED_SAMPLE_NUMBER, 0, SAMPLE_NUMBER));
    if (x == SAMPLE_NUMBER) x = SAMPLE_NUMBER-1;
    newTime[i] = sigTime[x];
    if (i != 0) {
      if (i == 1)
        newAmpl[i] = findReconstructedPoint(sigAmpl[x], sigAmpl[x - 1], newTime[i / (SAMPLE_NUMBER / RECONSTRUCTED_SAMPLE_NUMBER)], newTime[i / (SAMPLE_NUMBER / RECONSTRUCTED_SAMPLE_NUMBER)] - 2); // z tych dwoch punktow ukladamy wzor funkcji oraz obliczamy a i b ktore sa punktami ktore trzeba wlozyc w rekonstruowany sygnal
      else
        newAmpl[i] = findReconstructedPoint(sigAmpl[x - 1], sigAmpl[x - 2], newTime[i / (SAMPLE_NUMBER / RECONSTRUCTED_SAMPLE_NUMBER)] - 1, newTime[i / (SAMPLE_NUMBER / RECONSTRUCTED_SAMPLE_NUMBER)] - 2); // z tych dwoch punktow ukladamy wzor funkcji oraz obliczamy a i b ktore sa punktami ktore trzeba wlozyc w rekonstruowany sygnal
    } else {
      newAmpl[i] =  sigAmpl[x];
    }
    newAmpl[i] = sigAmpl[x];
  }
  float newTimeDoubled[] = new float[(RECONSTRUCTED_SAMPLE_NUMBER)+1];
  newTimeDoubled[0] = newTime[0];
  float newAmplDoubled[] = new float[(RECONSTRUCTED_SAMPLE_NUMBER)+1];
  newAmplDoubled[0] = newAmpl[0];
  for (int i = 1; i <=RECONSTRUCTED_SAMPLE_NUMBER; i++) {
    if (newAmpl[i] < newAmpl[i-1]) {
      newAmplDoubled[(i)-1] = newAmpl[i];
      newTimeDoubled[(i)-1] = newTime[i-1];
    } else {
      newAmplDoubled[(i)-1] = newAmpl[i-1];
      newTimeDoubled[(i)-1] = newTime[i];
    }
    newAmplDoubled[(i)] = newAmpl[i];
    newTimeDoubled[(i)] = newTime[i];
  }
  newTimeDoubled[0] = sigTime[0];
  recTime = new float[(RECONSTRUCTED_SAMPLE_NUMBER)+1];
  recAmpl = new float[(RECONSTRUCTED_SAMPLE_NUMBER)+1];
  arrayCopy(newTimeDoubled, recTime);
  arrayCopy(newAmplDoubled, recAmpl);
}

class ReconstructedSignalSincBasic extends Signal {
  float[] time = new float[RECONSTRUCTED_SAMPLE_NUMBER]; // tablica przechowujaca Y
  Signal sourceSignal;
  int sampleRate;

  public ReconstructedSignalSincBasic(Signal sS, int sR) {
    super(sS.signalS, sS.signalE, sS.ampl);
    this.amp = new FloatList(RECONSTRUCTED_SAMPLE_NUMBER);
    this.sampleRate = sR;
    time[0] = this.signalS;
    int j = int(this.signalS);
    for (int i = 0; i < RECONSTRUCTED_SAMPLE_NUMBER * (SAMPLE_NUMBER / RECONSTRUCTED_SAMPLE_NUMBER); i += (SAMPLE_NUMBER / RECONSTRUCTED_SAMPLE_NUMBER)) {
      if (i != 0)
        time[i / (SAMPLE_NUMBER / RECONSTRUCTED_SAMPLE_NUMBER)] = j;

      int firstSample = i;
      int lastSample = firstSample + sampleRate;
      //zabezpieczenie przeciwko array out of bounds
      if (firstSample < 0) {
        lastSample = lastSample - firstSample;
        firstSample = 0;
        if (lastSample > SAMPLE_NUMBER) {
          lastSample = SAMPLE_NUMBER;
        }
      } else if (lastSample > SAMPLE_NUMBER) {
        firstSample = firstSample - (lastSample - SAMPLE_NUMBER);
        lastSample = SAMPLE_NUMBER;
        if (firstSample < 0) {
          firstSample = 0;
        }
      }
      float step = (signalE - signalS) / SAMPLE_NUMBER;
      float sum = 0.0;
      for (int k = firstSample; k < lastSample; k++) {
        sum += sS.amp.get(k) * sinc((i - step - k));
      }
      this.amp.set(i / (SAMPLE_NUMBER / RECONSTRUCTED_SAMPLE_NUMBER), sum);

      j++;
    }
    sourceSignal = sS;
  }
}

double sinc(double t) {
  if (t == 0.0) {
    return 1.0;
  } else {
    return Math.sin(PI * t) / (PI * t);
  }
}
