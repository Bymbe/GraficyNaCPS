import org.gicentre.utils.stat.*;
XYChart lineChart;

float[] zeroTen = {0, 10, 1000};

ContinuosSignal S1 = new ContinuosSignal(zeroTen);
Gauss S2 = new Gauss(0, 10, 1000, 0, 1);
Sinusoidal S3 = new Sinusoidal(zeroTen, 10);
RectifiedOneSinusoidal S4 = new RectifiedOneSinusoidal(zeroTen, 10);
RectifiedTwoSinusoidal S5 = new RectifiedTwoSinusoidal(zeroTen, 10);
Rectangular S6 = new Rectangular(zeroTen, 10, 5);
SymmetricalRectangular S7 = new SymmetricalRectangular(zeroTen, 10, 5);
Triangular S8 = new Triangular(zeroTen, 10, 5);
UnitStroke S9 = new UnitStroke(zeroTen);

int wyborWykresu = 0;
String signalType;

void setup() {
  size(1280, 720);
  textFont(createFont("Arial", 10), 10);
  S1.calculate();
  S2.calculate();
  S3.calculate();
  S4.calculate();
  S5.calculate();
  S6.calculate();
  S7.calculate();
  S8.calculate();
  S9.calculate();
  background(255);
  textSize(16);
}

void draw() {
  background(255);

  switch(wyborWykresu) {
  case 1:
    chart(S1.time, S1.amp.array());
    signalType = "Szum o rozkładzie jednostajnym";
    break;
  case 2:
    chart(S2.time, S2.amp.array());
    signalType = "Szum gaussowski";
    break;
  case 3:
    chart(S3.time, S3.amp.array());
    signalType = "Sygnał sinusoidalny";
    break;
  case 4:
    chart(S4.time, S4.amp.array());
    signalType = "Sygnał sinusoidalny wyprostowany jednopołówkowo";
    break;
  case 5:
    chart(S5.time, S5.amp.array());
    signalType = "Sygnał sinusoidalny wyprostowany dwupołówkowo";
    break;
  case 6:
    chart(S6.time, S6.amp.array());
    signalType = "Sygnał prostokątny";
    break;
  case 7:
    chart(S7.time, S7.amp.array());
    signalType = "Sygnał prostokątny symetryczny";
    break;
  case 8:
    chart(S8.time, S8.amp.array());
    signalType = "Sygnał trójkątny";
    break;
  case 9:
    chart(S9.time, S9.amp.array());
    signalType = "Skok jednostkowy";
    break;
  default:
    chart(S1.time, S1.amp.array());
    signalType = "Szum o rozkładzie jednostajnym";
    break;
  }
  
  lineChart.draw(0, 0, width, height*0.8);
  
  fill(0);
  text("Wybierz rodzaj sygnału klawiszami 1-9", width*0.01, height*0.85);
  text("Obecny sygnał: " + signalType, width*0.01, height*0.90);
}

void keyPressed() {
  if (key == '1') {
    wyborWykresu = 1;
  } else if (key == '2') {
    wyborWykresu = 2;
  } else if (key == '3') {
    wyborWykresu = 3;
  } else if (key == '4') {
    wyborWykresu = 4;
  } else if (key == '5') {
    wyborWykresu = 5;
  } else if (key == '6') {
    wyborWykresu = 6;
  } else if (key == '7') {
    wyborWykresu = 7; 
  } else if (key == '8') {
    wyborWykresu = 8; 
  } else if (key == '9') {
    wyborWykresu = 9; 
  }
}

void chart(float[] x, float[] y) {
  lineChart = new XYChart(this);
  lineChart.setData(x, y);
  lineChart.showXAxis(true);
  lineChart.showYAxis(true);
  lineChart.setPointColour(color(180, 50, 50, 100));
  lineChart.setPointSize(5);
  lineChart.setLineWidth(2);
}
