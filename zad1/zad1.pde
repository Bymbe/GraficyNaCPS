import org.gicentre.utils.stat.*;
XYChart lineChart;
XYChart scatterplot;

int LICZBA_PROBEK = 1000;

float[] zeroTen = {0, 10, 1000};
int wyborWykresu = 1;
String signalType;
String impulsType;
boolean isItSignalOrImpulse = true;
float[] toZeroX = {0, 0};
float[] toZeroY = {0, 0};
float[] loadedFloatList;
String signalName;
float[] a = {1, 2, 3, 4};
String[] string1;
String[] string2;

ContinuosSignal S1 = new ContinuosSignal(zeroTen);
Gauss S2 = new Gauss(0, 10, 1000, 0, 1);
Sinusoidal S3 = new Sinusoidal(zeroTen, 10);
RectifiedOneSinusoidal S4 = new RectifiedOneSinusoidal(zeroTen, 10);
RectifiedTwoSinusoidal S5 = new RectifiedTwoSinusoidal(zeroTen, 10);
Rectangular S6 = new Rectangular(zeroTen, 10, 5);
SymmetricalRectangular S7 = new SymmetricalRectangular(zeroTen, 10, 5);
Triangular S8 = new Triangular(zeroTen, 10, 5);
UnitStroke S9 = new UnitStroke(zeroTen);

UnitImpulse I1 = new UnitImpulse(1000, 1000, 25, 0);
NoiseImpulse I2 = new NoiseImpulse(1000, 1000, 500, 50);

void setup() {
  rectMode(CORNERS);
  textAlign(CENTER, CENTER);
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
  I1.calculate();
  I2.calculate();
  background(255);
  textSize(16);
}

void draw() {
  background(255);

  switch(wyborWykresu) {
  case 1:
    scatter(toZeroX, toZeroY);
    chart(S1.time, S1.amp.array());
    signalType = "Szum o rozkładzie jednostajnym";
    signalName = "szumJednostajny";
    break;
  case 2:
    scatter(toZeroX, toZeroY);
    chart(S2.time, S2.amp.array());
    signalType = "Szum gaussowski";
    signalName = "szumGaussowski";
    break;
  case 3:
    scatter(toZeroX, toZeroY);
    chart(S3.time, S3.amp.array());
    signalType = "Sygnał sinusoidalny";
    signalName = "sygnalSin";
    break;
  case 4:
    scatter(toZeroX, toZeroY);
    chart(S4.time, S4.amp.array());
    signalType = "Sygnał sinusoidalny wyprostowany jednopołówkowo";
    signalName = "sygnalSinWyprJedn";
    break;
  case 5:
    scatter(toZeroX, toZeroY);
    chart(S5.time, S5.amp.array());
    signalType = "Sygnał sinusoidalny wyprostowany dwupołówkowo";
    signalName = "sygnalSinWyprDwu";
    break;
  case 6:
    scatter(toZeroX, toZeroY);
    chart(S6.time, S6.amp.array());
    signalType = "Sygnał prostokątny";
    signalName = "sygnalProstokatny";
    break;
  case 7:
    scatter(toZeroX, toZeroY);
    chart(S7.time, S7.amp.array());
    signalType = "Sygnał prostokątny symetryczny";
    signalName = "sygnalProstokatnySym";
    break;
  case 8:
    scatter(toZeroX, toZeroY);
    chart(S8.time, S8.amp.array());
    signalType = "Sygnał trójkątny";
    signalName = "sygnalTrojkatny";
    break;
  case 9:
    scatter(toZeroX, toZeroY);
    chart(S9.time, S9.amp.array());
    signalType = "Skok jednostkowy";
    signalName = "sygnalJednostkowy";
    break;
  case 10:
    chart(toZeroX, toZeroY);
    scatter(I1.time, I1.amp.array());
    impulsType = "Impuls jednostkowy";
    signalName = "impulsJednostkowy";
    break;
  case 11:
    chart(toZeroX, toZeroY);
    scatter(I2.time, I2.amp.array());
    impulsType = "Szum impulsowy";
    signalName = "szumImpulsowy";
    break;
  default:
    scatter(toZeroX, toZeroY);
    chart(S1.time, S1.amp.array());
    signalType = "Szum o rozkładzie jednostajnym";
    signalName = "szumJednostajny";
    break;
  }


  fill(0);
  text("Wybierz rodzaj sygnału klawiszami '1-9', lub impulsu '0', lub '-'", width*0.01, height*0.90);


  if (isItSignalOrImpulse) {
    textSize(20);
    text("Obecny sygnał: " + signalType, width/2, height*0.05);
    textSize(16);
    lineChart.draw(0, height*0.1, width, height*0.7);
  } else {
    textSize(20);
    text("Obecny impuls: " + impulsType, width/2, height*0.05);
    textSize(16);
    scatterplot.draw(0, 0, width, height*0.8);
  }


  drawButtons();
}

void scatter(float[] x, float[] y) {
  scatterplot = new XYChart(this);
  scatterplot.setData(x, y);
  scatterplot.showXAxis(true);
  scatterplot.showYAxis(true);
  scatterplot.setPointColour(color(20, 20, 120, 100));
  scatterplot.setPointSize(5);
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
