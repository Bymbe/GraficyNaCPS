//te calki to jakas masakra
//kocham calki

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
  textSize(10);
  text("Średnia: " + meanValue(S), width*0.90, height*0.15);
  text("Średnia bezwzględna: " + absMeanValue(S), width*0.90, height*0.18);
  text("Wariancja: " + varianceValue(S), width*0.90, height*0.21);
  text("Odchylenie: " + rmsValue(S), width*0.90, height*0.24);
  text("Moc średnia: " + meanPowerValue(S), width*0.90, height*0.27);
}
