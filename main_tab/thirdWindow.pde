public void showChooseWindow3() {
  String[] args = {"YourSketchNameHere"};
  ThirdApplet ta = new ThirdApplet();
  PApplet.runSketch(args, ta);
}

public class ThirdApplet extends PApplet {

  public void settings() {
    size(displayWidth/4, displayHeight/2);
  }
  public void draw() {
    background(255);
    fill(0);
    drawThirdWindowButtons();
  }

  void mouseReleased() {
    wasMousePressedLastFrame = false;
  }

  void drawThirdWindowButtons() {
    rectMode(CORNERS);
    drawOknoProstokatne(); //1
    drawOknoHamminga(); //2
    drawOknoHanninga(); //3
    drawOknoBlackmana(); //4
    drawDolnoprzepustowa(); //5
    drawSrodkowoprzepustowa(); //6
    drawRekonstrukcjaSinc(); //7
  }



  void drawOknoProstokatne() {
    if (mouseX >= width*0.0 && mouseX <= width*0.5  && mouseY >= height*0.00 && mouseY <= height*0.333) {
      if (mousePressed && wasMousePressedLastFrame == false) {
        wasMousePressedLastFrame = true;
        filterWindowChoice = 1;
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
    text("OKNO PROSTOKĄTNE", width*0.0, height*0.0, width*0.5, height*0.333);
  }

  void drawOknoHamminga() {
    if (mouseX >= width*0.5 && mouseX <= width*1.0  && mouseY >= height*0.00 && mouseY <= height*0.333) {
      if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
        wasMousePressedLastFrame = true;
        filterWindowChoice = 2;
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
    text("OKNO HAMMINGA", width*0.5, height*0.0, width*1.0, height*0.333);
  }

  void drawOknoHanninga() {
    if (mouseX >= width*0.0 && mouseX <= width*0.5  && mouseY >= height*0.334 && mouseY <= height*0.666) {
      if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
        wasMousePressedLastFrame = true;
        filterWindowChoice = 3;
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
    text("OKNO HANNINGA", width*0.0, height*0.334, width*0.5, height*0.666);
  }

  void drawOknoBlackmana() {
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
    text("OKNO BLACKMANA", width*0.5, height*0.334, width*1.0, height*0.666);
  }

  void drawDolnoprzepustowa() {
    if (mouseX >= width*0.0 && mouseX <= width*0.333  && mouseY >= height*0.666 && mouseY <= height*1) {
      if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
        wasMousePressedLastFrame = true;
        filterPassChoice = 1;
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
    text("FILTRACJA DOLNOPRZEPUSTOWA", width*0.0, height*0.667, width*0.333, height*1);
  }

  void drawSrodkowoprzepustowa() {
    if (mouseX >= width*0.334 && mouseX <= width*0.666  && mouseY >= height*0.666 && mouseY <= height*1) {
      if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
        wasMousePressedLastFrame = true;
        filterPassChoice = 2;
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
    text("FILTRACJA ŚRODKOWOPRZEPUSTOWA", width*0.334, height*0.667, width*0.666, height*1);
  }

  void drawRekonstrukcjaSinc() {
    if (mouseX >= width*0.667 && mouseX <= width*1  && mouseY >= height*0.666 && mouseY <= height*1) {
      if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
        wasMousePressedLastFrame = true;
        filterPassChoice = 3;
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
    text("FILTRACJA GÓRNOPRZEPUSTOWA", width*0.667, height*0.667, width*1, height*1);
  }
}
