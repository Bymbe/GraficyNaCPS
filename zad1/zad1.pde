 import controlP5.*;
import org.gicentre.utils.stat.*;

void setup() { /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////SETUP
  lineChart = new XYChart(this);
  scatterplot = new XYChart(this);
  reconstructedChart = new XYChart(this);
  barChart = new BarChart(this);

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

void draw() { /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////DRAW
  surface.setTitle(nf(frameRate, 0, 1) + " FPS");
  background(255);
  fill(0);
  switch(wyborWykresu) {
  case 1:
    chart(S1.time, S1.amp.array());
    signalType = "Szum o rozkładzie jednostajnym";
    signalName = "szumJednostajny";
    calculateData(S1);
    showSelectedReconstruction(S1.time, S1.amp.array());
    break;
  case 2:
    chart(S2.time, S2.amp.array());
    signalType = "Szum gaussowski";
    calculateData(S2);
    showSelectedReconstruction(S2.time, S2.amp.array());
    break;
  case 3:
    chart(S3.time, S3.amp.array());
    signalType = "Sygnał sinusoidalny";
    signalName = "sygnalSin";
    calculateData(S3);
    showSelectedReconstruction(S3.time, S3.amp.array());
    break;
  case 4:
    chart(S4.time, S4.amp.array());
    signalType = "Sygnał sinusoidalny wyprostowany jednopołówkowo";
    signalName = "sygnalSinWyprJedn";
    calculateData(S4);
    showSelectedReconstruction(S4.time, S4.amp.array());
    break;
  case 5:
    chart(S5.time, S5.amp.array());
    signalType = "Sygnał sinusoidalny wyprostowany dwupołówkowo";
    signalName = "sygnalSinWyprDwu";
    calculateData(S5);
    showSelectedReconstruction(S5.time, S5.amp.array());
    break;
  case 6:
    chart(S6.time, S6.amp.array());
    signalType = "Sygnał prostokątny";
    signalName = "sygnalProstokatny";
    calculateData(S6);
    showSelectedReconstruction(S6.time, S6.amp.array());
    break;
  case 7:
    chart(S7.time, S7.amp.array());
    signalType = "Sygnał prostokątny symetryczny";
    signalName = "sygnalProstokatnySym";
    calculateData(S7);
    showSelectedReconstruction(S7.time, S7.amp.array());
    break;
  case 8:
    chart(S8.time, S8.amp.array());
    signalType = "Sygnał trójkątny";
    signalName = "sygnalTrojkatny";
    calculateData(S8);
    showSelectedReconstruction(S8.time, S8.amp.array());
    break;
  case 9:
    chart(S9.time, S9.amp.array());
    signalType = "Skok jednostkowy";
    signalName = "sygnalJednostkowy";
    calculateData(S9);
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
      chart(S0.time, S0.amp.array());
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
  reconstructedChart.setMaxX(lineChart.getMaxX());
  reconstructedChart.setMinX(lineChart.getMinX());
  barChart.setMaxValue(lineChart.getMaxY());
  barChart.setMinValue(lineChart.getMinY());
  if (wyborWykresu < 10) { // UI
    isItSignalOrImpulse = true;
    textAlign(CENTER, CENTER);
    textSize(20);
    text("Obecny sygnał (" + wyborWykresu + "): " + signalType, width/2, height*0.05);
    text("Obecna rekonstrukcja (" + reconstructionChoice + "): " + reconstructionType, width/2, height*0.08);
    textSize(16);
    lineChart.draw(0, height*0.1, width*0.85, height*0.65);
    if (isReconstructionChartVisible && wyborWykresu >2) {
      if(showLineChart == true) reconstructedChart.draw(0, height*0.1, width*0.85, height*0.65);
      if(showBarChart == true) barChart.draw(0, height*0.1, width*0.85, height*0.65);
    }
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
  SAMPLE_RATE = int(cp5.getController("sample rate").getValue());
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
