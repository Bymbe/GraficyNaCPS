void setReconstructionType() {
  switch(reconstructionChoice) {
  case 1:
    reconstructionType = "próbkowanie równomierne";
    break;
  case 2:
    reconstructionType = "kwantyzacja równomierna z obcięciem";
    break;
  case 3:
    reconstructionType = "kwantyzacja równomierna z zaokrąglaniem";
    break;
  case 4:
    reconstructionType = "ekstrapolacja zerowego rzędu";
    break;
  case 5:
    reconstructionType = "interpolacja pierwszego rzędu";
    break;
  case 6:
    reconstructionType = "rekonstrukcja w oparciu o funkcję sinc";
    break;
  case 7:
    reconstructionType = "alliasing";
    break;
  }
}

String convultionSignalType(int convSignalChoice) {
  switch(convSignalChoice) {
  case 1:
    return "Szumu o rozkładzie jednostajnym";
  case 2:
    return "Szumu gaussowskiego";
  case 3:
    return "Sygnału sinusoidalnego";
  case 4:
    return "Sygnału sinusoidalnego wyprostowanego jednopołówkowo";
  case 5:
    return "Sygnału sinusoidalnego wyprostowanego dwupołówkowo";
  case 6:
    return "Sygnału prostokątnego";
  case 7:
    return "Sygnału prostokątnego symetrycznie";
  case 8:
    return "Sygnału trójkątnego";
  case 9:
    return "Skoku jednostkowego";
  default:
    return "";
  }
}

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
  if (key == ',') {
    easteregg();
  }
}

void mouseReleased() {
  wasMousePressedLastFrame = false;
}

void easteregg() {
  for (int i=0; i<100; i++) {
    surface.setLocation(width/5 + int(random(-10, 10)), height/4 + int(random(-10, 10)));
  }
  surface.setLocation(width/5, height/4);
}
