int RECONSTRUCTED_SAMPLE_NUMBER = 50;
float QUANTIZATION_JUMP_SIZE = 2; //skok pionowy

float recTime[];
float recAmpl[];

void showSelectedReconstruction(float[] xaxis, float[] yaxis) {
  switch(reconstructionChoice) {
  case 1:
    //
    break;
  case 2:
    quantizationCut(xaxis, yaxis);
    reconstructed(recTime, recAmpl);
    break;
  case 3:
    //
    break;
  case 4:
    //
    break;
  case 5:
    //
    break;
  case 6:
    //
    break;
  }
}

void quantizationCut(float[] sigTime, float[] sigAmpl) {
  float newTime[] = new float[RECONSTRUCTED_SAMPLE_NUMBER+1];
  float newAmpl[] = new float[RECONSTRUCTED_SAMPLE_NUMBER+1];
  int x = 0;

  for (int i = 0; i <= RECONSTRUCTED_SAMPLE_NUMBER; i++) {

    x = int(map(i, 0, RECONSTRUCTED_SAMPLE_NUMBER, 0, SAMPLE_NUMBER));

    if (x == SAMPLE_NUMBER) x = SAMPLE_NUMBER-1;

    newAmpl[i] = sigAmpl[x] - sigAmpl[x]%QUANTIZATION_JUMP_SIZE; //tutaj gdyby to bylo tylko probkowanie to wystarczyloby bez odejmowania modulo
    if(sigAmpl[x] < 0) newAmpl[i] = sigAmpl[x] - sigAmpl[x]%QUANTIZATION_JUMP_SIZE - QUANTIZATION_JUMP_SIZE;
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