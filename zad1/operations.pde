void calculate() {
  switch(w1) {
  case 1:
    calc1 = S1.amp.array();
    break;
  case 2:
    calc1 = S2.amp.array();
    break;
  case 3:
    calc1 = S3.amp.array();
    break;
  case 4:
    calc1 = S4.amp.array();
    break;
  case 5:
    calc1 = S5.amp.array();
    break;
  case 6:
    calc1 = S6.amp.array();
    break;
  case 7:
    calc1 = S7.amp.array();
    break;
  case 8:
    calc1 = S8.amp.array();
    break;
  case 9:
    calc1 = S9.amp.array();
    break;
  case 10:
    calc1 = I1.amp.array();
    break;
  case 11:
    calc1 = I2.amp.array();
    break;
  }
  switch(w2) {
  case 1:
    calc2 = S1.amp.array();
    break;
  case 2:
    calc2 = S2.amp.array();
    break;
  case 3:
    calc2 = S3.amp.array();
    break;
  case 4:
    calc2 = S4.amp.array();
    break;
  case 5:
    calc2 = S5.amp.array();
    break;
  case 6:
    calc2 = S6.amp.array();
    break;
  case 7:
    calc2 = S7.amp.array();
    break;
  case 8:
    calc2 = S8.amp.array();
    break;
  case 9:
    calc2 = S9.amp.array();
    break;
  case 10:
    calc2 = I1.amp.array();
    break;
  case 11:
    calc2 = I2.amp.array();
    break;
  }
  try {
    switch(operacjaString) {
    case "+":
      for (int i=0; i < calc1.length; i++) {
        calcTime[i] = S1.time[i];
        calcResult[i] = calc1[i] + calc2[i];
      }
      break;
    case "-":
      for (int i=0; i < calc1.length; i++) {
        calcTime[i] = S1.time[i];
        calcResult[i] = calc1[i] - calc2[i];
      }
      break;
    case "*":
      for (int i=0; i < calc1.length; i++) {
        calcTime[i] = S1.time[i];
        calcResult[i] = calc1[i] * calc2[i];
      }
      break;
    case "/":
      for (int i=0; i < calc1.length; i++) {
        calcTime[i] = S1.time[i];
        if (calc2[i] != 0) calcResult[i] = calc1[i] / calc2[i];
        else calcResult[i] = USER_AMPLITUDE * 5;
      }
      break;
    }
  }
  catch (Exception e) {
    println("tutaj sie zesralo");
  }
  S12 = new Signal(0, 10, calcResult, calcTime, S1.ampl);
}

//FloatList addSignals(Signal A, Signal B) {
//  FloatList a1 = A.amp;
//  FloatList b1 = B.amp;
//  FloatList result = new FloatList();
//  for (int i = 0; i < A.amp.size(); i += (A.signalE - A.signalS) / SAMPLE_NUMBER)  result.set(i, A.amp.get(i) + B.amp.get(i));
//  return result;
//}

//FloatList subSignals(Signal A, Signal B) {
//  FloatList a1 = A.amp;
//  FloatList b1 = B.amp;
//  FloatList result = new FloatList();
//  for (int i = 0; i < A.amp.size(); i += (A.signalE - A.signalS) / SAMPLE_NUMBER)  result.set(i, A.amp.get(i) - B.amp.get(i));
//  return result;
//}

//FloatList mulSignals(Signal A, Signal B) {
//  FloatList a1 = A.amp;
//  FloatList b1 = B.amp;
//  FloatList result = new FloatList();
//  for (int i = 0; i < A.amp.size(); i += (A.signalE - A.signalS) / SAMPLE_NUMBER)  result.set(i, A.amp.get(i) * B.amp.get(i));
//  return result;
//}

//FloatList divSignals(Signal A, Signal B) {
//  FloatList a1 = A.amp;
//  FloatList b1 = B.amp;
//  FloatList result = new FloatList();
//  for (int i = 0; i < A.amp.size(); i += (A.signalE - A.signalS) / SAMPLE_NUMBER) {
//    if ( int(B.amp.get(i)) == 0 ) result.set(i, USER_AMPLITUDE * 5);
//    else result.set(i, A.amp.get(i) / B.amp.get(i));
//  }
//  return result;
//}
