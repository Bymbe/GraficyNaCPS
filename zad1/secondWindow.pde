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
    ellipse(100, 50, 10, 10);
    if(mouseButton == LEFT) surface.setVisible(false);
  }
}
