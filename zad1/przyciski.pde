int buttonColor = 200;
int m1cooldown = 0;

void saveButton() {
  if (mouseX >= width*0.80 && mouseX <= width*0.88  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && m1cooldown <= 0) { //KLIKNIECIE PRZYCISKU ZAPISZ
      m1cooldown = 10;
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
  textAlign(LEFT);
}

void loadButton() {
  if (mouseX >= width*0.90 && mouseX <= width*0.98  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && m1cooldown <= 0) { //KLIKNIECIE PRZYCISKU WCZYTAJ
      m1cooldown = 10;
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



void drawButtons() {
  loadButton();
  saveButton();
  
  if(m1cooldown > 0) m1cooldown--;
}
