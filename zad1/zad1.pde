import org.gicentre.utils.stat.*;
XYChart lineChart;

float[] zeroTen = {0, 10, 1000};

ContinuosSignal S1 = new ContinuosSignal(zeroTen);
Gauss S2 = new Gauss(0, 10, 1000, 0, 1);
Sinusoidal S3 = new Sinusoidal(zeroTen);
StraightSinusoidal S4 = new StraightSinusoidal(zeroTen);

void setup()
{
  size(1000, 500);
  textFont(createFont("Arial", 10), 10);
  S1.calculate();
  S2.calculate();
  background(255);
  textSize(16);
}

void draw()
{
  text("Choose signalse using numbers from 0 to 9", 50, 50);
  int number = Console();
      switch(number) {
        case 0:
          chart(S1.time, S1.amp.array());
          lineChart.draw(0, 0, width-30, height-30);
          break;
        case 1:
          chart(S2.time, S2.amp.array());
          lineChart.draw(0, 0, width-30, height-30);
          break;
        case 2:
          chart(S3.time, S3.amp.array());
          lineChart.draw(0, 0, width-30, height-30);
          break;
        case 3:
          chart(S4.time, S4.amp.array());
          lineChart.draw(0, 0, width-30, height-30);
          break;
  }
}
 
int Console()
{
  if(key == '0'){
    return 0;
  }
  else if(key == '1') {
    return 1;
  }
  else if(key == '2') {
    return 2; 
  }
  else if(key == '3') {
    return 3; 
  }
  return -1;
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
