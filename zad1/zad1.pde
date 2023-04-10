import controlP5.*;
import org.gicentre.utils.stat.*;
XYChart lineChart;
XYChart scatterplot;
XYChart reconstructedChart;

ControlP5 cp5, cp6;

int SAMPLE_NUMBER = 200; //liczba probek
float USER_AMPLITUDE = 10; //amplituda
float USER_PERIOD = 2; //okres podstawowy dla sygnalow z okresem
float SIGNAL_START = 0.0; //poczatek sygnalu w sekundach
float SIGNAL_END = 10.0; //koniec sygnalu w sekundach
float FILL_FACTOR = 0.5; //wspolczynnik wypelnienia
float SAMPLE_RATE = 5;

float IMPULSE_FREQUENCY = 1000;
int IMPULSE_AMPLITUDE = 10;
int IMPULSE_FIRSTSAMPLE = 25;
int IMPULSE_JUMPSAMPLE = 0;
float IMPULSE_PROBABILITY = 0.25;
int IMPULSE_NOISETIME = 50;

float[] startEndAmp = {SIGNAL_START, SIGNAL_END, USER_AMPLITUDE}; //poczatek i koniec sygnalu oraz amplituda

int wyborWykresu = 1;
String signalType;
String impulsType;
boolean isItSignalOrImpulse = true; // flaga okreslajaca czy wyswietalmy signaly czy impuls aby podmienic tekst w ui
float[] toZeroX = {0, 0}; // pomocniczna tablica do wyzerowania wykresu, aby poprzedni nie chodzil na naastepny // tablica osi X
float[] toZeroY = {0, 0}; // -||- tablica osi Y
float[] loadedFloatList;
String signalName;
float[] a = {1, 2, 3, 4};
String[] string1;
String[] string2;
boolean wasMousePressedLastFrame = false;
String wykres1String, operacjaString, wykres2String; // zmienne do operacji na sygnalach
int w1, op, w2; // ^^ w formie intow
float[] calc1, calc2;
float[] calcResult = new float[SAMPLE_NUMBER];
float[] calcTime = new float[SAMPLE_NUMBER];

Boolean isReconstructionChartVisible = false;

int reconstructionChoice = 1;
String reconstructionType;

Signal S0;

ContinuosSignal S1 = new ContinuosSignal(startEndAmp);
Gauss S2 = new Gauss(startEndAmp, 0, 1); //startEndAmp, srednia, odchylenie
Sinusoidal S3 = new Sinusoidal(startEndAmp, USER_PERIOD); //startEndAmp, okres, term
RectifiedOneSinusoidal S4 = new RectifiedOneSinusoidal(startEndAmp, USER_PERIOD); //startEndAmp, okres
RectifiedTwoSinusoidal S5 = new RectifiedTwoSinusoidal(startEndAmp, USER_PERIOD); //startEndAmp, okres
Rectangular S6 = new Rectangular(startEndAmp, USER_PERIOD, FILL_FACTOR); //startEndAmp, okres, wspolczynnik wypelnienia
SymmetricalRectangular S7 = new SymmetricalRectangular(startEndAmp, USER_PERIOD, FILL_FACTOR); //startEndAmp, okres, wspolczynnik wypelnienia
Triangular S8 = new Triangular(startEndAmp, USER_PERIOD, FILL_FACTOR); //startEndAmp, okres, wspolczynnik wypelnienia
UnitStroke S9 = new UnitStroke(startEndAmp, USER_PERIOD); //startEndAmp

UnitImpulse I1 = new UnitImpulse(IMPULSE_FREQUENCY, USER_AMPLITUDE, IMPULSE_FIRSTSAMPLE, IMPULSE_JUMPSAMPLE);
NoiseImpulse I2 = new NoiseImpulse(IMPULSE_FREQUENCY, USER_AMPLITUDE, FILL_FACTOR, IMPULSE_NOISETIME);

ReconstructedSignalFirstOrderHold R1;
ReconstructedSignalSincBasic R2;
ReconstructedSignalZeroOrderHold R3;

void setup() {
  lineChart = new XYChart(this);
  scatterplot = new XYChart(this);
  reconstructedChart = new XYChart(this);

  cp5 = new ControlP5(this);
  cp6 = new ControlP5(this);
  StaticDraw();
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
  rectMode(CORNERS);
  textAlign(CENTER, CENTER);
  size(1280, 720);
  background(255);
  textSize(16);
}

void draw() {
  surface.setTitle(nf(frameRate, 0, 1) + " FPS");
  background(255);
  fill(0);
  switch(wyborWykresu) {
  case 1:
    chart(S1.time, S1.amp.array());
    //reconstructed(toZeroX, toZeroY);
    signalType = "Szum o rozkładzie jednostajnym";
    signalName = "szumJednostajny";
    calculateData(S1);

    reconstructSignalFirstOrderHold(S1);
    reconstructSignalZeroOrderHold(S1);
    reconstructSignalSincBasic(S1);
    showSelectedReconstruction(S1.time, S1.amp.array());

    break;
  case 2:
    chart(S2.time, S2.amp.array());
    signalType = "Szum gaussowski";
    signalName = "szumGaussowski";
    calculateData(S2);

    reconstructSignalFirstOrderHold(S2);
    reconstructSignalZeroOrderHold(S2);
    reconstructSignalSincBasic(S2);
    showSelectedReconstruction(S2.time, S2.amp.array());

    break;
  case 3:
    chart(S3.time, S3.amp.array());
    signalType = "Sygnał sinusoidalny";
    signalName = "sygnalSin";
    calculateData(S3);

    reconstructSignalFirstOrderHold(S3);
    reconstructSignalZeroOrderHold(S3);
    reconstructSignalSincBasic(S3);
    reconstructed(R1.time, R1.amp.array());
    showSelectedReconstruction(S3.time, S3.amp.array());

    break;
  case 4:
    chart(S4.time, S4.amp.array());
    signalType = "Sygnał sinusoidalny wyprostowany jednopołówkowo";
    signalName = "sygnalSinWyprJedn";
    calculateData(S4);

    reconstructSignalFirstOrderHold(S4);
    reconstructSignalZeroOrderHold(S4);
    reconstructSignalSincBasic(S4);
    showSelectedReconstruction(S4.time, S4.amp.array());

    break;
  case 5:
    chart(S5.time, S5.amp.array());
    signalType = "Sygnał sinusoidalny wyprostowany dwupołówkowo";
    signalName = "sygnalSinWyprDwu";
    calculateData(S5);

    reconstructSignalFirstOrderHold(S5);
    reconstructSignalZeroOrderHold(S5);
    reconstructSignalSincBasic(S5);
    showSelectedReconstruction(S5.time, S5.amp.array());

    break;
  case 6:
    chart(S6.time, S6.amp.array());
    signalType = "Sygnał prostokątny";
    signalName = "sygnalProstokatny";
    calculateData(S6);

    reconstructSignalFirstOrderHold(S6);
    reconstructSignalZeroOrderHold(S6);
    reconstructSignalSincBasic(S6);
    showSelectedReconstruction(S6.time, S6.amp.array());

    break;
  case 7:
    chart(S7.time, S7.amp.array());
    signalType = "Sygnał prostokątny symetryczny";
    signalName = "sygnalProstokatnySym";
    calculateData(S7);
    reconstructSignalFirstOrderHold(S7);
    reconstructSignalZeroOrderHold(S7);
    reconstructSignalSincBasic(S7);
    showSelectedReconstruction(S7.time, S7.amp.array());
    break;
  case 8:
    chart(S8.time, S8.amp.array());
    signalType = "Sygnał trójkątny";
    signalName = "sygnalTrojkatny";
    calculateData(S8);
    reconstructSignalFirstOrderHold(S8);
    reconstructSignalZeroOrderHold(S8);
    reconstructSignalSincBasic(S8);
    showSelectedReconstruction(S8.time, S8.amp.array());
    break;
  case 9:
    chart(S9.time, S9.amp.array());
    signalType = "Skok jednostkowy";
    signalName = "sygnalJednostkowy";
    calculateData(S9);
    reconstructSignalFirstOrderHold(S9);
    reconstructSignalZeroOrderHold(S9);
    reconstructSignalSincBasic(S9);
    showSelectedReconstruction(S8.time, S8.amp.array());
    break;
  case 10:
    scatter(I1.time, I1.amp.array());
    impulsType = "Impuls jednostkowy";
    signalName = "impulsJednostkowy";
    break;
  case 11:
    scatter(I2.time, I2.amp.array());
    impulsType = "Szum impulsowy";
    signalName = "szumImpulsowy";
    break;
  case 0:
    try {
      impulsType = "Sygnal poddany operacji";
      signalName = "Sygnal poddany operacja";
      chart(S0.time, S0.amp.array()); //X DO PODMIANY
      calculateData(S0);
    }
    catch (Exception e) {
      print("Wykres nie dziala");
    }
    impulsType = "Wynik operacji";
    signalName = "wynikOperacji";
    break;
  default:
    chart(S1.time, S1.amp.array());
    signalType = "Szum o rozkładzie jednostajnym";
    signalName = "szumJednostajny";
    break;
  }

  fill(0);

  setReconstructionType();
  reconstructedChart.setMaxY(lineChart.getMaxY());
  reconstructedChart.setMinY(lineChart.getMinY());

  if (wyborWykresu < 10) { // UI
    isItSignalOrImpulse = true;
    textAlign(CENTER, CENTER);
    textSize(20);
    text("Obecny sygnał (" + wyborWykresu + "): " + signalType, width/2, height*0.05);
    text("Obecna rekonstrukcja (" + reconstructionChoice + "): " + reconstructionType, width/2, height*0.08);
    textSize(16);
    lineChart.draw(0, height*0.1, width*0.85, height*0.65);
    if (isReconstructionChartVisible && wyborWykresu >2) reconstructedChart.draw(0, height*0.1, width*0.85, height*0.65);
  } else {
    isItSignalOrImpulse = false;
    textSize(20);
    text("Obecny impuls (" + wyborWykresu + "): " + impulsType, width/2, height*0.05);
    text("Obecna rekonstrukcja (" + reconstructionChoice + "): " + reconstructionType, width/2, height*0.08);
    textSize(16);
    scatterplot.draw(0, 0, width*0.85, height*0.65);
    //if (isReconstructionChartVisible && wyborWykresu >2) reconstructedChart.draw(0, height*0.1, width*0.85, height*0.65);
  }
  textSize(16);
  textAlign(LEFT);
  text("Alternatywny wybór grafu (od '1' do '-')", 20, 600);
  textAlign(LEFT);
  textSize(12);
  text("Możliwość wyboru dezaktywuje się po najechaniu kursorem na okienka operacji: ", 20, 630);
  text(">", 230, 631);
  textSize(16);
  fill(0);
  text("wykres 1", width*0.42, height*0.83);
  text("operacja", width*0.48, height*0.83);
  text("wykres 2", width*0.54, height*0.83);
  textAlign(CENTER);
  textSize(12);
  text("(Wciśnij ENTER po wpisaniu każdej z wartości)", width*0.50, height*0.80);
  textSize(20);
  ActiveDraw();

  USER_AMPLITUDE = int(cp5.getController("amplitude").getValue()); //aktualizowanie co klatke amplitudy wybranej przez uzytkownika i odswiezenie jej w sygnalach
  USER_PERIOD = (cp5.getController("period").getValue());
  FILL_FACTOR = (cp5.getController("fill factor").getValue());
  QUANTIZATION_JUMP_SIZE = (cp5.getController("vertical jump size").getValue());
  RECONSTRUCTED_SAMPLE_NUMBER = int((cp5.getController("reconstrucion sample number").getValue()));
  cp5.getController("reconstrucion sample number").setValue(RECONSTRUCTED_SAMPLE_NUMBER);

  S1.setAmplitude(USER_AMPLITUDE);
  S2.setAmplitude(USER_AMPLITUDE);
  S3.setAmplitude(USER_AMPLITUDE);
  S4.setAmplitude(USER_AMPLITUDE);
  S5.setAmplitude(USER_AMPLITUDE);
  S6.setAmplitude(USER_AMPLITUDE);
  S7.setAmplitude(USER_AMPLITUDE);
  S8.setAmplitude(USER_AMPLITUDE);
  S9.setAmplitude(USER_AMPLITUDE);
  S3.setPeriod(USER_PERIOD);
  S4.setPeriod(USER_PERIOD);
  S5.setPeriod(USER_PERIOD);
  S6.setPeriod(USER_PERIOD);
  S7.setPeriod(USER_PERIOD);
  S8.setPeriod(USER_PERIOD);
  S9.setPeriod(USER_PERIOD);
  I1.setAmplitude(USER_AMPLITUDE);
  I2.setAmplitude(USER_AMPLITUDE);
  S6.setFillFactor(FILL_FACTOR);
  S7.setFillFactor(FILL_FACTOR);
  S8.setFillFactor(FILL_FACTOR);
  I2.setProbability(FILL_FACTOR);
  if (isReconstructionChartVisible) {
    switch(reconstructionChoice) {
    case 4:
      //reconstructed(R3.time, R3.amp.array());
    case 5:
      //reconstructed(R1.time, R1.amp.array());
    case 6:
      //reconstructed(R2.time, R2.amp.array());
    }
  }
  if (cp5.getController("amplitude").isMousePressed()) { //przeliczenie wartosci nowego sygnalu z nowa amplituda, dzieki temu slider nadaza za sygnalem i na odwrot, przelaczajac sygnal wartosc amplitudy sie zgadza a nie jest poprzednia zapisana
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
  }
  if (cp5.getController("period").isMousePressed()) {
    S3.calculate();
    S4.calculate();
    S5.calculate();
    S6.calculate();
    S7.calculate();
    S8.calculate();
    S9.calculate();
  }
  if (cp5.getController("fill factor").isMousePressed()) {
    S6.calculate();
    S7.calculate();
    S8.calculate();
    I2.calculate();
  }
}

void scatter(float[] x, float[] y) {
  scatterplot.setData(x, y);
  scatterplot.showXAxis(true);
  scatterplot.showYAxis(true);
  scatterplot.setPointColour(color(20, 20, 120, 100));
  scatterplot.setPointSize(3);
}

void chart(float[] x, float[] y) {
  lineChart.setData(x, y);
  lineChart.showXAxis(true);
  lineChart.showYAxis(true);
  lineChart.setPointColour(color(180, 50, 50, 100));
  lineChart.setPointSize(3);
  lineChart.setLineWidth(2);
}

void reconstructed(float[]x, float[] y) {
  reconstructedChart.setData(x, y);
  reconstructedChart.showXAxis(true);
  reconstructedChart.showYAxis(true);
  reconstructedChart.setPointColour(color(20, 20, 150, 255));
  reconstructedChart.setPointSize(4);
  reconstructedChart.setLineWidth(2);
  reconstructedChart.setLineColour(color(50, 50, 150));
  reconstructedChart.setAxisColour(color(0, 0));
  reconstructedChart.setAxisLabelColour(color(0, 0));
  reconstructedChart.setAxisValuesColour(color(0, 0));
}
