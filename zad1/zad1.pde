import controlP5.*;
import org.gicentre.utils.stat.*;
XYChart lineChart;
XYChart scatterplot;
ControlP5 cp5, cp6;

int SAMPLE_NUMBER = 1000; //liczba probek
float USER_AMPLITUDE = 10; //amplituda
float USER_PERIOD = 2; //okres podstawowy dla sygnalow z okresem
float SIGNAL_START = 0.0; //poczatek sygnalu w sekundach
float SIGNAL_END = 10.0; //koniec sygnalu w sekundach

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

Signal S0;

ContinuosSignal S1 = new ContinuosSignal(startEndAmp);
Gauss S2 = new Gauss(startEndAmp, 0, 1); //startEndAmp, srednia, odchylenie
Sinusoidal S3 = new Sinusoidal(startEndAmp, USER_PERIOD); //startEndAmp, okres, term
RectifiedOneSinusoidal S4 = new RectifiedOneSinusoidal(startEndAmp, USER_PERIOD);
RectifiedTwoSinusoidal S5 = new RectifiedTwoSinusoidal(startEndAmp, USER_PERIOD);
Rectangular S6 = new Rectangular(startEndAmp, USER_PERIOD, 0.5);
SymmetricalRectangular S7 = new SymmetricalRectangular(startEndAmp, USER_PERIOD, 0.5);
Triangular S8 = new Triangular(startEndAmp, USER_PERIOD, 0.5);
UnitStroke S9 = new UnitStroke(startEndAmp);

UnitImpulse I1 = new UnitImpulse(1000, 1000, 25, 0);
NoiseImpulse I2 = new NoiseImpulse(1000, 1000, 500, 50);

void setup() {
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
  background(255);
  switch(wyborWykresu) {
  case 1:
    chart(S1.time, S1.amp.array());
    signalType = "Szum o rozkładzie jednostajnym";
    signalName = "szumJednostajny";
    break;
  case 2:
    chart(S2.time, S2.amp.array());
    signalType = "Szum gaussowski";
    signalName = "szumGaussowski";
    break;
  case 3:
    chart(S3.time, S3.amp.array());
    signalType = "Sygnał sinusoidalny";
    signalName = "sygnalSin";
    break;
  case 4:
    chart(S4.time, S4.amp.array());
    signalType = "Sygnał sinusoidalny wyprostowany jednopołówkowo";
    signalName = "sygnalSinWyprJedn";
    break;
  case 5:
    chart(S5.time, S5.amp.array());
    signalType = "Sygnał sinusoidalny wyprostowany dwupołówkowo";
    signalName = "sygnalSinWyprDwu";
    break;
  case 6:
    chart(S6.time, S6.amp.array());
    signalType = "Sygnał prostokątny";
    signalName = "sygnalProstokatny";
    break;
  case 7:
    chart(S7.time, S7.amp.array());
    signalType = "Sygnał prostokątny symetryczny";
    signalName = "sygnalProstokatnySym";
    break;
  case 8:
    chart(S8.time, S8.amp.array());
    signalType = "Sygnał trójkątny";
    signalName = "sygnalTrojkatny";
    break;
  case 9:
    chart(S9.time, S9.amp.array());
    signalType = "Skok jednostkowy";
    signalName = "sygnalJednostkowy";
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

  if (wyborWykresu < 10) { // UI
    isItSignalOrImpulse = true;
    textSize(20);
    text("Obecny sygnał (" + wyborWykresu + "): " + signalType, width/2, height*0.05);
    textSize(16);
    lineChart.draw(0, height*0.1, width, height*0.65);
  } else {
    isItSignalOrImpulse = false;
    textSize(20);
    text("Obecny impuls (" + wyborWykresu + "): " + impulsType, width/2, height*0.05);
    textSize(16);
    scatterplot.draw(0, 0, width, height*0.65);
  }
  textSize(16);
  fill(#12FA61);
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
  }
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
