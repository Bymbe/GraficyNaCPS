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
  lineChart.setPointSize(4);
  lineChart.setLineWidth(1);
}

void reconstructed(float[]x, float[] y) {
  reconstructedChart.setData(x, y);
  reconstructedChart.showXAxis(true);
  reconstructedChart.showYAxis(true);
  reconstructedChart.setPointColour(color(20, 20, 150, 255));
  reconstructedChart.setPointSize(6);
  reconstructedChart.setLineWidth(1);
  reconstructedChart.setLineColour(color(50, 50, 150));
  reconstructedChart.setAxisColour(color(0, 0));
  reconstructedChart.setAxisLabelColour(color(0, 0));
  reconstructedChart.setAxisValuesColour(color(0, 0));
}

void bar(float[] y) {
  barChart.setData(y);
  barChart.showCategoryAxis(true);
  barChart.showValueAxis(true);
  barChart.setBarColour(color(70, 70, 150));
  barChart.setCategoryAxisAt(0);
  barChart.setValueFormat("");
}
