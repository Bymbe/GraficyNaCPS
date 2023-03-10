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


void drawButtons() {
  loadButton();
  saveButton();
  arrowButtons();
}
