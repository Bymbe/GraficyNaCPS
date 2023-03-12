int buttonColor = 200;

void saveButton() {
  if (mouseX >= width*0.80 && mouseX <= width*0.88  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      initiateSaveToFile();
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.80, height*0.85, width*0.88, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("ZAPISZ", width*0.80, height*0.85, width*0.88, height*0.98);
}

void loadButton() {
  if (mouseX >= width*0.90 && mouseX <= width*0.98  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU WCZYTAJ
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      initiateLoadFromFile();
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.90, height*0.85, width*0.98, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("WCZYTAJ", width*0.90, height*0.85, width*0.98, height*0.98);
  textAlign(LEFT);
}

void arrowButtons() {
  if (mouseX >= width*0.60 && mouseX <= width*0.68  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU POPRZEDNI
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      if (wyborWykresu > 1) wyborWykresu--;
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.60, height*0.85, width*0.68, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("POPRZEDNI SYGNAŁ", width*0.60, height*0.85, width*0.68, height*0.98);

  if (mouseX >= width*0.70 && mouseX <= width*0.78  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU NASTEPNY
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      if (wyborWykresu < 11) wyborWykresu++;
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.70, height*0.85, width*0.78, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("NASTĘPNY SYGNAŁ", width*0.70, height*0.85, width*0.78, height*0.98);
}

void addButton() {
    if (mouseX >= width*0.70 && mouseX <= width*0.78  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU DODAJ
      switch(wyborWykres) {
        case 1:
        // wybor wykresu - aktualnie ogladane
        // i sume zrobie
        // zmienna jakas nowa - poprzednio ogladane
      }
      wasMousePressedLastFrame = true;
      buttonColor = 100;
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.50, height*0.85, width*0.58, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("DODAJ SYGNAŁ", width*0.50, height*0.85, width*0.58, height*0.98);
}

void amplitudeButton() {
  String slid1 = "amplitude";
  cp5.addSlider(slid1)
        .setBroadcast(false)
        .setPosition(20, 650)
        .setValue(USER_AMPLITUDE)
        .setRange(10, 10000)
        .setSize(200, 50)
        .setSliderMode(Slider.FLEXIBLE)
        .setBroadcast(true)
        .setColorCaptionLabel(#12FA61)
        .getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE)
        .setPaddingX(0);
}

void drawSliders() {
  amplitudeButton();
}

void drawButtons() {
  addButton();
  loadButton();
  saveButton();
  arrowButtons();
}
