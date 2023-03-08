void keyPressed() {
  if (key == '1') {
    wyborWykresu = 1;
    signalImpuls = true;
  }
  if (key == '2') {
    wyborWykresu = 2;
    signalImpuls = true;
  }
  if (key == '3') {
    wyborWykresu = 3;
    signalImpuls = true;
  }
  if (key == '4') {
    wyborWykresu = 4;
    signalImpuls = true;
  }
  if (key == '5') {
    wyborWykresu = 5;
    signalImpuls = true;
  }
  if (key == '6') {
    wyborWykresu = 6;
    signalImpuls = true;
  }
  if (key == '7') {
    wyborWykresu = 7;
    signalImpuls = true;
  }
  if (key == '8') {
    wyborWykresu = 8;
    signalImpuls = true;
  }
  if (key == '9') {
    wyborWykresu = 9;
    signalImpuls = true;
  }
  if (key == '0') {
    wyborWykresu = 10;
    signalImpuls = false;
  }
  if (key == '-') {
    wyborWykresu = 11;
    signalImpuls = false;
  }
  if (key == 's') {
    inititateSaveToFile();
  }
  if(key == 'l') {
    initiateLoadFromFile();
  }
}
