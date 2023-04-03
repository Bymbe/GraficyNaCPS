public void showChooseWindow() {
  String[] args = {"YourSketchNameHere"};
  SecondApplet sa = new SecondApplet();
  PApplet.runSketch(args, sa);
}

public class SecondApplet extends PApplet {

  public void settings() {
    size(400, 400);
  }
  public void draw() {
    background(255);
    fill(0);
    drawSecondWindowButtons();
    println(reconstructionChoice);
  }

  void mouseReleased() {
    wasMousePressedLastFrame = false;
  }

  void drawSecondWindowButtons() {
    rectMode(CORNERS);
    drawProbkowanieRownomierne();
    drawKwantyzacjaObciazenie();
    drawKwantyzacjaZaokroglenie();
    drawEkstrapolacjaZerowegoRzedu();
    drawInterpolacjaPierwszegoRzedu();
    drawRekonstrukcjaSinc();
  }

  void drawProbkowanieRownomierne() {
    if (mouseX >= width*0.0 && mouseX <= width*1.0  && mouseY >= height*0.00 && mouseY <= height*0.333) {
      if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
        wasMousePressedLastFrame = true;
        reconstructionChoice = 1;
        surface.setVisible(false);
        buttonColor = 100;
      } else {
        buttonColor = 150;
      }
    } else buttonColor = 200;
    fill(buttonColor);
    rect(width*0.0, height*0.0, width*1.0, height*0.333);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("PRÓBKOWANIE RÓWNOMIERNE", width*0.0, height*0.0, width*1.0, height*0.333);
  }

  void drawKwantyzacjaObciazenie() {
    if (mouseX >= width*0.0 && mouseX <= width*0.5  && mouseY >= height*0.334 && mouseY <= height*0.666) {
      if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
        wasMousePressedLastFrame = true;
        reconstructionChoice = 2;
        surface.setVisible(false);
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
    text("KWANTYZACJA RÓWNOMIERNA Z OBCIĄŻENIEM", width*0.0, height*0.334, width*0.5, height*0.666);
  }

  void drawKwantyzacjaZaokroglenie() {
    if (mouseX >= width*0.5 && mouseX <= width*1.0  && mouseY >= height*0.334 && mouseY <= height*0.666) {
      if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
        wasMousePressedLastFrame = true;
        reconstructionChoice = 3;
        surface.setVisible(false);
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
    text("KWANTYZACJA RÓWNOMIERNA Z ZAOKRĄGLENIEM", width*0.5, height*0.334, width*1.0, height*0.666);
  }

  void drawEkstrapolacjaZerowegoRzedu() {
    if (mouseX >= width*0.0 && mouseX <= width*0.333  && mouseY >= height*0.666 && mouseY <= height*1) {
      if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
        wasMousePressedLastFrame = true;
        reconstructionChoice = 4;
        surface.setVisible(false);
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
        surface.setVisible(false);
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
        surface.setVisible(false);
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
