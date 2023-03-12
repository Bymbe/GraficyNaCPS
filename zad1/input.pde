boolean activeWriting = false;

void keyPressed() {
  if (!(cp6.getController("wykres1").isMouseOver() || cp6.getController("operacja").isMouseOver() || cp6.getController("wykres2").isMouseOver())) { // jezeli wpisujemy to nie bedzie zmienialo nam wykresu w tle 
    if (key == '1') {
      wyborWykresu = 1;
      isItSignalOrImpulse = true;
    }
    if (key == '2') {
      wyborWykresu = 2;
      isItSignalOrImpulse = true;
    }
    if (key == '3') {
      wyborWykresu = 3;
      isItSignalOrImpulse = true;
    }
    if (key == '4') {
      wyborWykresu = 4;
      isItSignalOrImpulse = true;
    }
    if (key == '5') {
      wyborWykresu = 5;
      isItSignalOrImpulse = true;
    }
    if (key == '6') {
      wyborWykresu = 6;
      isItSignalOrImpulse = true;
    }
    if (key == '7') {
      wyborWykresu = 7;
      isItSignalOrImpulse = true;
    }
    if (key == '8') {
      wyborWykresu = 8;
      isItSignalOrImpulse = true;
    }
    if (key == '9') {
      wyborWykresu = 9;
      isItSignalOrImpulse = true;
    }
    if (key == '0') {
      wyborWykresu = 10;
      isItSignalOrImpulse = false;
    }
    if (key == '-') {
      wyborWykresu = 11;
      isItSignalOrImpulse = false;
    }
  }
  if (key == 's') {
    initiateSaveToFile();
  }
  if (key == 'l') {
    initiateLoadFromFile();
  }
}

void mouseReleased() {
  wasMousePressedLastFrame = false;
}
