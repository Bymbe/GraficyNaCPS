//sygnal zespolony to rzeczywisty z czescia urojona zero
//transformaty robimy na sygnalach zespolonych

void showBothCharts() {
  switch(complexChartsType) {
  case 1:
    whichChart4TypeIsVisible = "góra - rzeczywiste, dół - urojone";
    chart4up(S3.time, S3.amp.array()); //czesc rzeczywista
    chart4down(S3.time, S3.amp.array()); //czesc urojona
    break;
  case 2:
    whichChart4TypeIsVisible = "góra - moduł, dół - argument";
    chart4up(S3.time, S3.amp.array()); //modul liczby zespolonej z=sqrt(rzeczywista^2 + urojona^2)
    chart4down(S3.time, S3.amp.array()); //czesc urojona
    break;
  }
}
