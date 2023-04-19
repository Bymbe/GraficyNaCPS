public void showChooseWindow() {
  String[] args = {"YourSketchNameHere"};
  SecondApplet sa = new SecondApplet();
  PApplet.runSketch(args, sa);
}

public class SecondApplet extends PApplet {

  public void settings() {
    size(displayWidth/4, displayHeight/2);
  }
  public void draw() {
    background(255);
    fill(0);
    drawSecondWindowButtons();
  }

  void mouseReleased() {
    wasMousePressedLastFrame = false;
  }

  void drawSecondWindowButtons() {
    rectMode(CORNERS);
    drawProbkowanieRownomierne();
    drawKwantyzacjaObciecie();
    drawKwantyzacjaZaokroglenie();
    drawEkstrapolacjaZerowegoRzedu();
    drawInterpolacjaPierwszegoRzedu();
    drawRekonstrukcjaSinc();
    drawAlliasing();
  }
  
  void drawAlliasing() {
    if (mouseX >= width*0.5 && mouseX <= width*1.0  && mouseY >= height*0.00 && mouseY <= height*0.333) {
      if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
        wasMousePressedLastFrame = true;
        reconstructionChoice = 7;
        if (platformNames[platform] != "macos") surface.setVisible(false);
        buttonColor = 100;
      } else {
        buttonColor = 150;
      }
    } else buttonColor = 200;
    fill(buttonColor);
    rect(width*0.5, height*0.0, width*1.0, height*0.333);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("ALIASING", width*0.5, height*0.0, width*1.0, height*0.333);
  }

  void drawProbkowanieRownomierne() {
    if (mouseX >= width*0.0 && mouseX <= width*0.5  && mouseY >= height*0.00 && mouseY <= height*0.333) {
      if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
        wasMousePressedLastFrame = true;
        reconstructionChoice = 1;
        if (platformNames[platform] != "macos") surface.setVisible(false);
        buttonColor = 100;
      } else {
        buttonColor = 150;
      }
    } else buttonColor = 200;
    fill(buttonColor);
    rect(width*0.0, height*0.0, width*0.5, height*0.333);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("PRÓBKOWANIE RÓWNOMIERNE", width*0.0, height*0.0, width*0.5, height*0.333);
  }

  void drawKwantyzacjaObciecie() {
    if (mouseX >= width*0.0 && mouseX <= width*0.5  && mouseY >= height*0.334 && mouseY <= height*0.666) {
      if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
        wasMousePressedLastFrame = true;
        reconstructionChoice = 2;
        if (platformNames[platform] != "macos") surface.setVisible(false);
        buttonColor = 100;
      } else {
        buttonColor = 150;
      }
    } else buttonColor = 200;
    fill(buttonColor);
    rect(width*0.0, height*0.334, width*0.5, height*0.666);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("KWANTYZACJA RÓWNOMIERNA Z OBCIĘCIEM", width*0.0, height*0.334, width*0.5, height*0.666);
  }

  void drawKwantyzacjaZaokroglenie() {
    if (mouseX >= width*0.5 && mouseX <= width*1.0  && mouseY >= height*0.334 && mouseY <= height*0.666) {
      if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
        wasMousePressedLastFrame = true;
        reconstructionChoice = 3;
        if (platformNames[platform] != "macos") surface.setVisible(false);
        buttonColor = 100;
      } else {
        buttonColor = 150;
      }
    } else buttonColor = 200;
    fill(buttonColor);
    rect(width*0.5, height*0.334, width*1.0, height*0.666);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("KWANTYZACJA RÓWNOMIERNA Z ZAOKRĄGLANIEM", width*0.5, height*0.334, width*1.0, height*0.666);
  }

  void drawEkstrapolacjaZerowegoRzedu() {
    if (mouseX >= width*0.0 && mouseX <= width*0.333  && mouseY >= height*0.666 && mouseY <= height*1) {
      if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
        wasMousePressedLastFrame = true;
        reconstructionChoice = 4;
        if (platformNames[platform] != "macos") surface.setVisible(false);
        buttonColor = 100;
      } else {
        buttonColor = 150;
      }
    } else buttonColor = 200;
    fill(buttonColor);
    rect(width*0.0, height*0.667, width*0.333, height*1);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("EKSTRAPOLACJA ZEROWEGO RZĘDU", width*0.0, height*0.667, width*0.333, height*1);
  }

  void drawInterpolacjaPierwszegoRzedu() {
    if (mouseX >= width*0.334 && mouseX <= width*0.666  && mouseY >= height*0.666 && mouseY <= height*1) {
      if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
        wasMousePressedLastFrame = true;
        reconstructionChoice = 5;
        if (platformNames[platform] != "macos") surface.setVisible(false);
        buttonColor = 100;
      } else {
        buttonColor = 150;
      }
    } else buttonColor = 200;
    fill(buttonColor);
    rect(width*0.334, height*0.667, width*0.666, height*1);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("INTERPOLACJA PIERWSZEGO RZĘDU", width*0.334, height*0.667, width*0.666, height*1);
  }

  void drawRekonstrukcjaSinc() {
    if (mouseX >= width*0.667 && mouseX <= width*1  && mouseY >= height*0.666 && mouseY <= height*1) {
      if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
        wasMousePressedLastFrame = true;
        reconstructionChoice = 6;
        if (platformNames[platform] != "macos") surface.setVisible(false);
        buttonColor = 100;
      } else {
        buttonColor = 150;
      }
    } else buttonColor = 200;
    fill(buttonColor);
    rect(width*0.667, height*0.667, width*1, height*1);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("REKONSTRUKCJA W OPARCIU O FUNKCJĘ SINC", width*0.667, height*0.667, width*1, height*1);
  }
}
