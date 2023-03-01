import org.gicentre.utils.stat.*;
XYChart lineChart;

Gauss S2 = new Gauss(0.0,10.0,0,1);


void setup()
{
  size(1000, 500);
  textFont(createFont("Arial", 10), 10);
}


void draw()
{
  S2.calculate();
  wykres();
  background(255);
  textSize(16);
  lineChart.draw(15, 15, width-30, height-30);

}

void wykres() {
  lineChart = new XYChart(this);
  lineChart.setData(S2.czas, S2.amplituda);


  lineChart.showXAxis(true);
  lineChart.showYAxis(true);

  lineChart.setPointColour(color(180, 50, 50, 100));
  lineChart.setPointSize(5);
  lineChart.setLineWidth(2);
}
