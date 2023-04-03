int buttonColor = 200;

void controlEvent(ControlEvent theEvent) {
  if (theEvent.getName() == "wykres1") {
    wykres1String = theEvent.getStringValue();
    w1 = int(wykres1String);
    println(w1);
  }
  if (theEvent.getName() == "operacja") {
    operacjaString = theEvent.getStringValue();
    println(operacjaString);
  }
  if (theEvent.getName() == "wykres2") {
    wykres2String = theEvent.getStringValue();
    w2 = int(wykres2String);
    println(w2);
  }
}

void operationTextFields() {
  PFont font;
  font = createFont("Arial", 50);
  cp6.addTextfield("wykres2")
    .setPosition(int(width*0.54), int(height*0.85))
    .setSize(int(width*0.04), int(height*0.13))
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 0, 0));
  cp6.addTextfield("operacja")
    .setPosition(int(width*0.48), int(height*0.85))
    .setSize(int(width*0.04), int(height*0.13))
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 0, 0));
  cp6.addTextfield("wykres1")
    .setPosition(int(width*0.42), int(height*0.85))
    .setSize(int(width*0.04), int(height*0.13))
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 0, 0));
}

void chooseReconstructedButton() {
  if (mouseX >= width*0.90 && mouseX <= width*0.98  && mouseY >= height*0.65 && mouseY <= height*0.73) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
      wasMousePressedLastFrame = true;
      showChooseWindow();
      buttonColor = 100;
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.90, height*0.65, width*0.98, height*0.73, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(12);
  text("WYBIERZ RODZAJ REKONSTRUKCJI", width*0.90, height*0.65, width*0.98, height*0.72);
}

void showReconstructedButton() {
  if (mouseX >= width*0.90 && mouseX <= width*0.98  && mouseY >= height*0.75 && mouseY <= height*0.83) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
      wasMousePressedLastFrame = true;
      isReconstructionChartVisible = !isReconstructionChartVisible;
      buttonColor = 100;
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.90, height*0.75, width*0.98, height*0.83, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(12);
  text("POKAŻ/UKRYJ REKONSTRUKCJĘ", width*0.90, height*0.75, width*0.98, height*0.83);
}

void calculateButton() {
  if (mouseX >= width*0.60 && mouseX <= width*0.68  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU LICZENIA
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      calculate();
      println("wykonano operacje");
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.60, height*0.85, width*0.68, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("WYKONAJ OPERACJĘ", width*0.60, height*0.85, width*0.68, height*0.98);

}

void saveButton() {
  if (mouseX >= width*0.90 && mouseX <= width*0.98  && mouseY >= height*0.85 && mouseY <= height*0.91) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      initiateSaveToFile();
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.90, height*0.85, width*0.98, height*0.91, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("ZAPISZ", width*0.90, height*0.85, width*0.98, height*0.91);
}

void loadButton() {
  if (mouseX >= width*0.90 && mouseX <= width*0.98  && mouseY >= height*0.92 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU WCZYTAJ
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      initiateLoadFromFile();
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.90, height*0.92, width*0.98, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("WCZYTAJ", width*0.90, height*0.92, width*0.98, height*0.98);
  textAlign(LEFT);
}

void arrowButtons() {
  if (mouseX >= width*0.70 && mouseX <= width*0.78  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU POPRZEDNI
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      if (wyborWykresu > 0) wyborWykresu--;
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.70, height*0.85, width*0.78, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("POPRZEDNI SYGNAŁ", width*0.70, height*0.85, width*0.78, height*0.98);

  if (mouseX >= width*0.80 && mouseX <= width*0.88  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU NASTEPNY
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      if (wyborWykresu < 11) wyborWykresu++;
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.80, height*0.85, width*0.88, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("NASTĘPNY SYGNAŁ", width*0.80, height*0.85, width*0.88, height*0.98);
}


void amplitudeButton() {
  String slid1 = "amplitude";
  cp5.addSlider(slid1)
    .setBroadcast(false)
    .setPosition(width*0.01, height*0.92)
    .setValue(USER_AMPLITUDE)
    .setRange(1, 100)
    .setSize(int(width*0.09), int(height*0.05))
    .setSliderMode(Slider.FLEXIBLE)
    .setBroadcast(true)
    .setColorCaptionLabel(#000000)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE)
    .setPaddingX(0);
}

void periodButton() {
  String slid2 = "period";
  cp5.addSlider(slid2)
    .setBroadcast(false)
    .setPosition(width*0.11, height*0.92)
    .setValue(USER_PERIOD)
    .setRange(0.1, 10)
    .setSize(int(width*0.09), int(height*0.05))
    .setSliderMode(Slider.FLEXIBLE)
    .setBroadcast(true)
    .setColorCaptionLabel(#000000)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE)
    .setPaddingX(0);
}

void fillFactorButton() {
  String slid3 = "fill factor";
  cp5.addSlider(slid3)
    .setBroadcast(false)
    .setPosition(width*0.21, height*0.92)
    .setValue(FILL_FACTOR)
    .setRange(0.0, 1.0)
    .setSize(int(width*0.09), int(height*0.05))
    .setSliderMode(Slider.FLEXIBLE)
    .setBroadcast(true)
    .setColorCaptionLabel(#000000)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE)
    .setPaddingX(0);
}

void StaticDraw() {
  operationTextFields();
  amplitudeButton();
  periodButton();
  fillFactorButton();
}

void ActiveDraw() {
  //addButton();
  loadButton();
  saveButton();
  arrowButtons();
  calculateButton();
  chooseReconstructedButton();
  showReconstructedButton();
}
