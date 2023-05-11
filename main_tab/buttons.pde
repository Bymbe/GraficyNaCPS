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

void adjustFilter() {
  if (mouseX >= width*0.90 && mouseX <= width*0.98  && mouseY >= height*0.67 && mouseY <= height*0.80) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
      wasMousePressedLastFrame = true;
      showChooseWindow3();
      buttonColor = 100;
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.90, height*0.67, width*0.98, height*0.80, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(16);
  text("DOSTOSUJ FILTRACJĘ", width*0.90, height*0.67, width*0.98, height*0.80);
}

void chooseNumerZadania() {
  if (mouseX >= width*0.90 && mouseX <= width*0.98  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
      wasMousePressedLastFrame = true;
      numerZadania += 1;
      if (numerZadania > 4) numerZadania = 1;
      if (numerZadania < 1) numerZadania = 1;
      buttonColor = 100;
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.90, height*0.85, width*0.98, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(12);
  text("PRZEŁĄCZ NUMER ZADANIA (" + numerZadania + ")", width*0.90, height*0.85, width*0.98, height*0.98);
}

void chooseReconstructedButton() {
  if (mouseX >= width*0.90 && mouseX <= width*0.98  && mouseY >= height*0.65 && mouseY <= height*0.72) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
      wasMousePressedLastFrame = true;
      showChooseWindow2();
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
  if (mouseX >= width*0.32 && mouseX <= width*0.40  && mouseY >= height*0.85 && mouseY <= height*0.91) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      initiateSaveToFile();
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.32, height*0.85, width*0.40, height*0.91, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("ZAPISZ", width*0.32, height*0.85, width*0.40, height*0.91);
}

void loadButton() {
  if (mouseX >= width*0.32 && mouseX <= width*0.40  && mouseY >= height*0.92 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU WCZYTAJ
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      initiateLoadFromFile();
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.32, height*0.92, width*0.40, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("WCZYTAJ", width*0.32, height*0.92, width*0.40, height*0.98);
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

void Conv_Filter_Cor_ShowButton() {
  if (mouseX >= width*0.40 && mouseX <= width*0.48  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU SPLOT 2
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      whichIsVisible++;
      if(whichIsVisible > 3) {
        whichIsVisible = 0;
      }
      if(whichIsVisible == 0) whichIsVisibleString = "nic";
      else if(whichIsVisible == 1) whichIsVisibleString = "splot";
      else if(whichIsVisible == 2) whichIsVisibleString = "filtrację ";
      else if(whichIsVisible == 3) whichIsVisibleString = "korelację";
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.40, height*0.85, width*0.48, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Obecnie wyświetlam " + whichIsVisibleString, width*0.40, height*0.85, width*0.48, height*0.98);
}

void operationChooseButtons() {
  if (mouseX >= width*0.50 && mouseX <= width*0.58  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU SPLOT 1
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      operationSignalChoice1 = wyborWykresu;
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.50, height*0.85, width*0.58, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(16);
  text("SYGNAŁ 1 DO OPERACJI (" + operationSignalChoice1 + ")", width*0.50, height*0.85, width*0.58, height*0.98);

  if (mouseX >= width*0.60 && mouseX <= width*0.68  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU SPLOT 2
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      operationSignalChoice2 = wyborWykresu;
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.60, height*0.85, width*0.68, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("SYGNAŁ 2 DO OPERACJI (" + operationSignalChoice2 + ")", width*0.60, height*0.85, width*0.68, height*0.98);
}


void amplitudeButton() {
  String slid1 = "amplitude";
  cp5.addSlider(slid1)
    .setBroadcast(false)
    .setPosition(width*0.01, height*0.92)
    .setValue(USER_AMPLITUDE)
    .setRange(1, 25)
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

void quantizationVerticalJumpSize() {
  String quanVertJump = "vertical jump size";
  cp5.addSlider(quanVertJump)
    .setBroadcast(false)
    .setPosition(width*0.88, height*0.45)
    .setValue(QUANTIZATION_JUMP_SIZE)
    .setRange(0.5, 10)
    .setSize(int(width*0.10), int(height*0.05))
    .setSliderMode(Slider.FLEXIBLE)
    .setBroadcast(true)
    .setColorCaptionLabel(#000000)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE)
    .setPaddingX(0);
}

void sincBasicSmpleRate() {
  String sampleRate = "sample rate";
  cp5.addSlider(sampleRate)
    .setBroadcast(false)
    .setPosition(width*0.88, height*0.45)
    .setValue(SAMPLE_RATE)
    .setRange(1, 10)
    .setSize(int(width*0.10), int(height*0.05))
    .setSliderMode(Slider.FLEXIBLE)
    .setBroadcast(true)
    .setColorCaptionLabel(#000000)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE)
    .setPaddingX(0);
}

void reconstructionSampleNumber() {
  String recSampleNumber = "reconstrucion sample number";
  cp5.addSlider(recSampleNumber)
    .setBroadcast(false)
    .setPosition(width*0.88, height*0.55)
    .setValue(RECONSTRUCTED_SAMPLE_NUMBER)
    .setRange(10, 250)
    .setSize(int(width*0.10), int(height*0.05))
    .setSliderMode(Slider.FLEXIBLE)
    .setBroadcast(true)
    .setColorCaptionLabel(#000000)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE)
    .setPaddingX(0);
}

void convolutionSampleNumber() {
  String convSampleNumber = "convolution sample number";
  cp5.addSlider(convSampleNumber)
    .setBroadcast(false)
    .setPosition(width*0.39, height*0.77)
    .setValue(SAMPLE_NUMBER)
    .setRange(0, SAMPLE_NUMBER)
    .setSize(int(width*0.14), int(height*0.05))
    .setSliderMode(Slider.FLEXIBLE)
    .setBroadcast(true)
    .setColorCaptionLabel(#000000)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE)
    .setPaddingX(0);
}

void delayCorelationNumber() {
  String delayCoreNumber = "delay corelation number";
  cp5.addSlider(delayCoreNumber)
    .setBroadcast(false)
    .setPosition(width*0.55, height*0.77)
    .setValue(SAMPLE_NUMBER)
    .setRange(0, SAMPLE_NUMBER)
    .setSize(int(width*0.14), int(height*0.05))
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
  quantizationVerticalJumpSize();
  sincBasicSmpleRate();
  reconstructionSampleNumber();
  convolutionSampleNumber();
  delayCorelationNumber();
}

void ActiveDraw() {
  //addButton();
  if (numerZadania == 1) loadButton();
  if (numerZadania == 1) saveButton();
  arrowButtons();
  if (numerZadania == 1) calculateButton();
  if (numerZadania == 2) chooseReconstructedButton();
  if (numerZadania == 2) showReconstructedButton();
  chooseNumerZadania();

  if (reconstructionChoice == 2 || reconstructionChoice == 3) {
    cp5.getController("vertical jump size").show();
  } else cp5.getController("vertical jump size").hide();
  if (reconstructionChoice == 6) {
    cp5.getController("sample rate").show();
  } else cp5.getController("sample rate").hide();

  if (numerZadania != 2) {
    cp5.getController("vertical jump size").hide();
    cp5.getController("sample rate").hide();
    cp5.getController("reconstrucion sample number").hide();
  } else cp5.getController("reconstrucion sample number").show();
  if (numerZadania != 1) {
    cp6.getController("wykres1").hide();
    cp6.getController("wykres2").hide();
    cp6.getController("operacja").hide();
  }
  if (numerZadania == 1) {
    cp6.getController("wykres1").show();
    cp6.getController("wykres2").show();
    cp6.getController("operacja").show();
  }

  if (numerZadania == 3) {
    operationChooseButtons();
    adjustFilter();
    Conv_Filter_Cor_ShowButton();
    cp5.getController("convolution sample number").show();
    cp5.getController("delay corelation number").show();
  } else  {
    cp5.getController("convolution sample number").hide();
    cp5.getController("delay corelation number").hide();
  }
}
