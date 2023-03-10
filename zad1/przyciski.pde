int buttonColor = 200;

void saveButton() {
  if (mouseX >= width*0.80 && mouseX <= width*0.88  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed) { //KLIKNIECIE PRZYCISKU ZAPISZ
      buttonColor = 100;
    } else buttonColor = 150;
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.80, height*0.85, width*0.88, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("ZAPISZ", width*0.80, height*0.85, width*0.88, height*0.98);
  textAlign(LEFT);
}

void loadButton() {
  if (mouseX >= width*0.90 && mouseX <= width*0.98  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed) { //KLIKNIECIE PRZYCISKU WCZYTAJ
      buttonColor = 100;
    } else buttonColor = 150;
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.90, height*0.85, width*0.98, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("WCZYTAJ", width*0.90, height*0.85, width*0.98, height*0.98);
  textAlign(LEFT);
}



void drawButtons() {
  loadButton();
  saveButton();
}
