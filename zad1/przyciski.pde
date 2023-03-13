int buttonColor = 200;

void controlEvent(ControlEvent theEvent) {
  boolean e1 = false;
  boolean e2 = false;
  boolean e3 = false;
  if (theEvent.getName() == "wykres1") {
    wykres1String = theEvent.getStringValue();
    w1 = int(wykres1String);
    println(w1);
    e1 = true;
  }
  if (theEvent.getName() == "operacja") {
    operacjaString = theEvent.getStringValue();
    println(operacjaString);
    e2 = true;
  }
  if (theEvent.getName() == "wykres2") {
    wykres2String = theEvent.getStringValue();
    w2 = int(wykres2String);
    println(w2);
    e3 = true;
  }
  if (e1 && e2 && e3) {
    Signal S12 = new Signal(0, 0, 0);
    switch(operacjaString) {
    case "+": ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      switch(w1) {
      case 1:
        switch(w2) {
        case 1:
          S12 = addSignals(S1, S1, "con");
          break;
        case 2:
          S12 = addSignals(S1, S2, "con");
          break;
        case 3:
          S12 = addSignals(S1, S3, "con");
          break;
        case 4:
          S12 = addSignals(S1, S4, "con");
          break;
        case 5:
          S12 = addSignals(S1, S5, "con");
          break;
        case 6:
          S12 = addSignals(S1, S6, "con");
          break;
        case 7:
          S12 = addSignals(S1, S7, "con");
          break;
        case 8:
          S12 = addSignals(S1, S8, "con");
          break;
        case 9:
          S12 = addSignals(S1, S9, "con");
          break;
        }
        break;
      case 2:
        switch(w2) {
        case 1:
          S12 = addSignals(S2, S1, "con");
          break;
        case 2:
          S12 = addSignals(S2, S2, "con");
          break;
        case 3:
          S12 = addSignals(S2, S3, "con");
          break;
        case 4:
          S12 = addSignals(S2, S4, "con");
          break;
        case 5:
          S12 = addSignals(S2, S5, "con");
          break;
        case 6:
          S12 = addSignals(S2, S6, "con");
          break;
        case 7:
          S12 = addSignals(S2, S7, "con");
          break;
        case 8:
          S12 = addSignals(S2, S8, "con");
          break;
        case 9:
          S12 = addSignals(S2, S9, "con");
          break;
        }
        break;
      case 3:
        switch(w2) {
        case 1:
          S12 = addSignals(S3, S1, "con");
          break;
        case 2:
          S12 = addSignals(S3, S2, "con");
          break;
        case 3:
          S12 = addSignals(S3, S3, "con");
          break;
        case 4:
          S12 = addSignals(S3, S4, "con");
          break;
        case 5:
          S12 = addSignals(S3, S5, "con");
          break;
        case 6:
          S12 = addSignals(S3, S6, "con");
          break;
        case 7:
          S12 = addSignals(S3, S7, "con");
          break;
        case 8:
          S12 = addSignals(S3, S8, "con");
          break;
        case 9:
          S12 = addSignals(S3, S9, "con");
          break;
        }
        break;
      case 4:
        switch(w2) {
        case 1:
          S12 = addSignals(S4, S1, "con");
          break;
        case 2:
          S12 = addSignals(S4, S2, "con");
          break;
        case 3:
          S12 = addSignals(S4, S3, "con");
          break;
        case 4:
          S12 = addSignals(S4, S4, "con");
          break;
        case 5:
          S12 = addSignals(S4, S5, "con");
          break;
        case 6:
          S12 = addSignals(S4, S6, "con");
          break;
        case 7:
          S12 = addSignals(S4, S7, "con");
          break;
        case 8:
          S12 = addSignals(S4, S8, "con");
          break;
        case 9:
          S12 = addSignals(S4, S9, "con");
          break;
        }
        break;
      case 5:
        switch(w2) {
        case 1:
          S12 = addSignals(S5, S1, "con");
          break;
        case 2:
          S12 = addSignals(S5, S2, "con");
          break;
        case 3:
          S12 = addSignals(S5, S3, "con");
          break;
        case 4:
          S12 = addSignals(S5, S4, "con");
          break;
        case 5:
          S12 = addSignals(S5, S5, "con");
          break;
        case 6:
          S12 = addSignals(S5, S6, "con");
          break;
        case 7:
          S12 = addSignals(S5, S7, "con");
          break;
        case 8:
          S12 = addSignals(S5, S8, "con");
          break;
        case 9:
          S12 = addSignals(S5, S9, "con");
          break;
        }
        break;
      case 6:
        switch(w2) {
        case 1:
          S12 = addSignals(S6, S1, "con");
          break;
        case 2:
          S12 = addSignals(S6, S2, "con");
          break;
        case 3:
          S12 = addSignals(S6, S3, "con");
          break;
        case 4:
          S12 = addSignals(S6, S4, "con");
          break;
        case 5:
          S12 = addSignals(S6, S5, "con");
          break;
        case 6:
          S12 = addSignals(S6, S6, "con");
          break;
        case 7:
          S12 = addSignals(S6, S7, "con");
          break;
        case 8:
          S12 = addSignals(S6, S8, "con");
          break;
        case 9:
          S12 = addSignals(S6, S9, "con");
          break;
        }
        break;
      case 7:
        switch(w2) {
        case 1:
          S12 = addSignals(S7, S1, "con");
          break;
        case 2:
          S12 = addSignals(S7, S2, "con");
          break;
        case 3:
          S12 = addSignals(S7, S3, "con");
          break;
        case 4:
          S12 = addSignals(S7, S4, "con");
          break;
        case 5:
          S12 = addSignals(S7, S5, "con");
          break;
        case 6:
          S12 = addSignals(S7, S6, "con");
          break;
        case 7:
          S12 = addSignals(S7, S7, "con");
          break;
        case 8:
          S12 = addSignals(S7, S8, "con");
          break;
        case 9:
          S12 = addSignals(S7, S9, "con");
          break;
        }
        break;
      case 8:
        switch(w2) {
        case 1:
          S12 = addSignals(S8, S1, "con");
          break;
        case 2:
          S12 = addSignals(S8, S2, "con");
          break;
        case 3:
          S12 = addSignals(S8, S3, "con");
          break;
        case 4:
          S12 = addSignals(S8, S4, "con");
          break;
        case 5:
          S12 = addSignals(S8, S5, "con");
          break;
        case 6:
          S12 = addSignals(S8, S6, "con");
          break;
        case 7:
          S12 = addSignals(S8, S7, "con");
          break;
        case 8:
          S12 = addSignals(S8, S8, "con");
          break;
        case 9:
          S12 = addSignals(S8, S9, "con");
          break;
        }
        break;
      case 9:
        switch(w2) {
        case 1:
          S12 = addSignals(S9, S1, "con");
          break;
        case 2:
          S12 = addSignals(S9, S2, "con");
          break;
        case 3:
          S12 = addSignals(S9, S3, "con");
          break;
        case 4:
          S12 = addSignals(S9, S4, "con");
          break;
        case 5:
          S12 = addSignals(S9, S5, "con");
          break;
        case 6:
          S12 = addSignals(S9, S6, "con");
          break;
        case 7:
          S12 = addSignals(S9, S7, "con");
          break;
        case 8:
          S12 = addSignals(S9, S8, "con");
          break;
        case 9:
          S12 = addSignals(S9, S9, "con");
          break;
        }
        break;
      }
      break;
    case "-": ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      switch(w1) {
      case 1:
        switch(w2) {
        case 1:
          S12 = subSignals(S1, S1, "con");
          break;
        case 2:
          S12 = subSignals(S1, S2, "con");
          break;
        case 3:
          S12 = subSignals(S1, S3, "con");
          break;
        case 4:
          S12 = subSignals(S1, S4, "con");
          break;
        case 5:
          S12 = subSignals(S1, S5, "con");
          break;
        case 6:
          S12 = subSignals(S1, S6, "con");
          break;
        case 7:
          S12 = subSignals(S1, S7, "con");
          break;
        case 8:
          S12 = subSignals(S1, S8, "con");
          break;
        case 9:
          S12 = subSignals(S1, S9, "con");
          break;
        }
        break;
      case 2:
        switch(w2) {
        case 1:
          S12 = subSignals(S2, S1, "con");
          break;
        case 2:
          S12 = subSignals(S2, S2, "con");
          break;
        case 3:
          S12 = subSignals(S2, S3, "con");
          break;
        case 4:
          S12 = subSignals(S2, S4, "con");
          break;
        case 5:
          S12 = subSignals(S2, S5, "con");
          break;
        case 6:
          S12 = subSignals(S2, S6, "con");
          break;
        case 7:
          S12 = subSignals(S2, S7, "con");
          break;
        case 8:
          S12 = subSignals(S2, S8, "con");
          break;
        case 9:
          S12 = subSignals(S2, S9, "con");
          break;
        }
        break;
      case 3:
        switch(w2) {
        case 1:
          S12 = subSignals(S3, S1, "con");
          break;
        case 2:
          S12 = subSignals(S3, S2, "con");
          break;
        case 3:
          S12 = subSignals(S3, S3, "con");
          break;
        case 4:
          S12 = subSignals(S3, S4, "con");
          break;
        case 5:
          S12 = subSignals(S3, S5, "con");
          break;
        case 6:
          S12 = subSignals(S3, S6, "con");
          break;
        case 7:
          S12 = subSignals(S3, S7, "con");
          break;
        case 8:
          S12 = subSignals(S3, S8, "con");
          break;
        case 9:
          S12 = subSignals(S3, S9, "con");
          break;
        }
        break;
      case 4:
        switch(w2) {
        case 1:
          S12 = subSignals(S4, S1, "con");
          break;
        case 2:
          S12 = subSignals(S4, S2, "con");
          break;
        case 3:
          S12 = subSignals(S4, S3, "con");
          break;
        case 4:
          S12 = subSignals(S4, S4, "con");
          break;
        case 5:
          S12 = subSignals(S4, S5, "con");
          break;
        case 6:
          S12 = subSignals(S4, S6, "con");
          break;
        case 7:
          S12 = subSignals(S4, S7, "con");
          break;
        case 8:
          S12 = subSignals(S4, S8, "con");
          break;
        case 9:
          S12 = subSignals(S4, S9, "con");
          break;
        }
        break;
      case 5:
        switch(w2) {
        case 1:
          S12 = subSignals(S5, S1, "con");
          break;
        case 2:
          S12 = subSignals(S5, S2, "con");
          break;
        case 3:
          S12 = subSignals(S5, S3, "con");
          break;
        case 4:
          S12 = subSignals(S5, S4, "con");
          break;
        case 5:
          S12 = subSignals(S5, S5, "con");
          break;
        case 6:
          S12 = subSignals(S5, S6, "con");
          break;
        case 7:
          S12 = subSignals(S5, S7, "con");
          break;
        case 8:
          S12 = subSignals(S5, S8, "con");
          break;
        case 9:
          S12 = subSignals(S5, S9, "con");
          break;
        }
        break;
      case 6:
        switch(w2) {
        case 1:
          S12 = subSignals(S6, S1, "con");
          break;
        case 2:
          S12 = subSignals(S6, S2, "con");
          break;
        case 3:
          S12 = subSignals(S6, S3, "con");
          break;
        case 4:
          S12 = subSignals(S6, S4, "con");
          break;
        case 5:
          S12 = subSignals(S6, S5, "con");
          break;
        case 6:
          S12 = subSignals(S6, S6, "con");
          break;
        case 7:
          S12 = subSignals(S6, S7, "con");
          break;
        case 8:
          S12 = subSignals(S6, S8, "con");
          break;
        case 9:
          S12 = subSignals(S6, S9, "con");
          break;
        }
        break;
      case 7:
        switch(w2) {
        case 1:
          S12 = subSignals(S7, S1, "con");
          break;
        case 2:
          S12 = subSignals(S7, S2, "con");
          break;
        case 3:
          S12 = subSignals(S7, S3, "con");
          break;
        case 4:
          S12 = subSignals(S7, S4, "con");
          break;
        case 5:
          S12 = subSignals(S7, S5, "con");
          break;
        case 6:
          S12 = subSignals(S7, S6, "con");
          break;
        case 7:
          S12 = subSignals(S7, S7, "con");
          break;
        case 8:
          S12 = subSignals(S7, S8, "con");
          break;
        case 9:
          S12 = subSignals(S7, S9, "con");
          break;
        }
        break;
      case 8:
        switch(w2) {
        case 1:
          S12 = subSignals(S8, S1, "con");
          break;
        case 2:
          S12 = subSignals(S8, S2, "con");
          break;
        case 3:
          S12 = subSignals(S8, S3, "con");
          break;
        case 4:
          S12 = subSignals(S8, S4, "con");
          break;
        case 5:
          S12 = subSignals(S8, S5, "con");
          break;
        case 6:
          S12 = subSignals(S8, S6, "con");
          break;
        case 7:
          S12 = subSignals(S8, S7, "con");
          break;
        case 8:
          S12 = subSignals(S8, S8, "con");
          break;
        case 9:
          S12 = subSignals(S8, S9, "con");
          break;
        }
        break;
      case 9:
        switch(w2) {
        case 1:
          S12 = subSignals(S9, S1, "con");
          break;
        case 2:
          S12 = subSignals(S9, S2, "con");
          break;
        case 3:
          S12 = subSignals(S9, S3, "con");
          break;
        case 4:
          S12 = subSignals(S9, S4, "con");
          break;
        case 5:
          S12 = subSignals(S9, S5, "con");
          break;
        case 6:
          S12 = subSignals(S9, S6, "con");
          break;
        case 7:
          S12 = subSignals(S9, S7, "con");
          break;
        case 8:
          S12 = subSignals(S9, S8, "con");
          break;
        case 9:
          S12 = subSignals(S9, S9, "con");
          break;
        }
        break;
      }
      break;
    case ":": ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      switch(w1) {
      case 1:
        switch(w2) {
        case 1:
          S12 = mulSignals(S1, S1, "con");
          break;
        case 2:
          S12 = mulSignals(S1, S2, "con");
          break;
        case 3:
          S12 = mulSignals(S1, S3, "con");
          break;
        case 4:
          S12 = mulSignals(S1, S4, "con");
          break;
        case 5:
          S12 = mulSignals(S1, S5, "con");
          break;
        case 6:
          S12 = mulSignals(S1, S6, "con");
          break;
        case 7:
          S12 = mulSignals(S1, S7, "con");
          break;
        case 8:
          S12 = mulSignals(S1, S8, "con");
          break;
        case 9:
          S12 = mulSignals(S1, S9, "con");
          break;
        }
        break;
      case 2:
        switch(w2) {
        case 1:
          S12 = mulSignals(S2, S1, "con");
          break;
        case 2:
          S12 = mulSignals(S2, S2, "con");
          break;
        case 3:
          S12 = mulSignals(S2, S3, "con");
          break;
        case 4:
          S12 = mulSignals(S2, S4, "con");
          break;
        case 5:
          S12 = mulSignals(S2, S5, "con");
          break;
        case 6:
          S12 = mulSignals(S2, S6, "con");
          break;
        case 7:
          S12 = mulSignals(S2, S7, "con");
          break;
        case 8:
          S12 = mulSignals(S2, S8, "con");
          break;
        case 9:
          S12 = mulSignals(S2, S9, "con");
          break;
        }
        break;
      case 3:
        switch(w2) {
        case 1:
          S12 = mulSignals(S3, S1, "con");
          break;
        case 2:
          S12 = mulSignals(S3, S2, "con");
          break;
        case 3:
          S12 = mulSignals(S3, S3, "con");
          break;
        case 4:
          S12 = mulSignals(S3, S4, "con");
          break;
        case 5:
          S12 = mulSignals(S3, S5, "con");
          break;
        case 6:
          S12 = mulSignals(S3, S6, "con");
          break;
        case 7:
          S12 = mulSignals(S3, S7, "con");
          break;
        case 8:
          S12 = mulSignals(S3, S8, "con");
          break;
        case 9:
          S12 = mulSignals(S3, S9, "con");
          break;
        }
        break;
      case 4:
        switch(w2) {
        case 1:
          S12 = mulSignals(S4, S1, "con");
          break;
        case 2:
          S12 = mulSignals(S4, S2, "con");
          break;
        case 3:
          S12 = mulSignals(S4, S3, "con");
          break;
        case 4:
          S12 = mulSignals(S4, S4, "con");
          break;
        case 5:
          S12 = mulSignals(S4, S5, "con");
          break;
        case 6:
          S12 = mulSignals(S4, S6, "con");
          break;
        case 7:
          S12 = mulSignals(S4, S7, "con");
          break;
        case 8:
          S12 = mulSignals(S4, S8, "con");
          break;
        case 9:
          S12 = mulSignals(S4, S9, "con");
          break;
        }
        break;
      case 5:
        switch(w2) {
        case 1:
          S12 = mulSignals(S5, S1, "con");
          break;
        case 2:
          S12 = mulSignals(S5, S2, "con");
          break;
        case 3:
          S12 = mulSignals(S5, S3, "con");
          break;
        case 4:
          S12 = mulSignals(S5, S4, "con");
          break;
        case 5:
          S12 = mulSignals(S5, S5, "con");
          break;
        case 6:
          S12 = mulSignals(S5, S6, "con");
          break;
        case 7:
          S12 = mulSignals(S5, S7, "con");
          break;
        case 8:
          S12 = mulSignals(S5, S8, "con");
          break;
        case 9:
          S12 = mulSignals(S5, S9, "con");
          break;
        }
        break;
      case 6:
        switch(w2) {
        case 1:
          S12 = mulSignals(S6, S1, "con");
          break;
        case 2:
          S12 = mulSignals(S6, S2, "con");
          break;
        case 3:
          S12 = mulSignals(S6, S3, "con");
          break;
        case 4:
          S12 = mulSignals(S6, S4, "con");
          break;
        case 5:
          S12 = mulSignals(S6, S5, "con");
          break;
        case 6:
          S12 = mulSignals(S6, S6, "con");
          break;
        case 7:
          S12 = mulSignals(S6, S7, "con");
          break;
        case 8:
          S12 = mulSignals(S6, S8, "con");
          break;
        case 9:
          S12 = mulSignals(S6, S9, "con");
          break;
        }
        break;
      case 7:
        switch(w2) {
        case 1:
          S12 = mulSignals(S7, S1, "con");
          break;
        case 2:
          S12 = mulSignals(S7, S2, "con");
          break;
        case 3:
          S12 = mulSignals(S7, S3, "con");
          break;
        case 4:
          S12 = mulSignals(S7, S4, "con");
          break;
        case 5:
          S12 = mulSignals(S7, S5, "con");
          break;
        case 6:
          S12 = mulSignals(S7, S6, "con");
          break;
        case 7:
          S12 = mulSignals(S7, S7, "con");
          break;
        case 8:
          S12 = mulSignals(S7, S8, "con");
          break;
        case 9:
          S12 = mulSignals(S7, S9, "con");
          break;
        }
        break;
      case 8:
        switch(w2) {
        case 1:
          S12 = mulSignals(S8, S1, "con");
          break;
        case 2:
          S12 = mulSignals(S8, S2, "con");
          break;
        case 3:
          S12 = mulSignals(S8, S3, "con");
          break;
        case 4:
          S12 = mulSignals(S8, S4, "con");
          break;
        case 5:
          S12 = mulSignals(S8, S5, "con");
          break;
        case 6:
          S12 = mulSignals(S8, S6, "con");
          break;
        case 7:
          S12 = mulSignals(S8, S7, "con");
          break;
        case 8:
          S12 = mulSignals(S8, S8, "con");
          break;
        case 9:
          S12 = mulSignals(S8, S9, "con");
          break;
        }
        break;
      case 9:
        switch(w2) {
        case 1:
          S12 = mulSignals(S9, S1, "con");
          break;
        case 2:
          S12 = mulSignals(S9, S2, "con");
          break;
        case 3:
          S12 = mulSignals(S9, S3, "con");
          break;
        case 4:
          S12 = mulSignals(S9, S4, "con");
          break;
        case 5:
          S12 = mulSignals(S9, S5, "con");
          break;
        case 6:
          S12 = mulSignals(S9, S6, "con");
          break;
        case 7:
          S12 = mulSignals(S9, S7, "con");
          break;
        case 8:
          S12 = mulSignals(S9, S8, "con");
          break;
        case 9:
          S12 = mulSignals(S9, S9, "con");
          break;
        }
        break;
      }
      break;
    case "*": ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      switch(w1) {
      case 1:
        switch(w2) {
        case 1:
          S12 = divSignals(S1, S1, "con");
          break;
        case 2:
          S12 = divSignals(S1, S2, "con");
          break;
        case 3:
          S12 = divSignals(S1, S3, "con");
          break;
        case 4:
          S12 = divSignals(S1, S4, "con");
          break;
        case 5:
          S12 = divSignals(S1, S5, "con");
          break;
        case 6:
          S12 = divSignals(S1, S6, "con");
          break;
        case 7:
          S12 = divSignals(S1, S7, "con");
          break;
        case 8:
          S12 = divSignals(S1, S8, "con");
          break;
        case 9:
          S12 = divSignals(S1, S9, "con");
          break;
        }
        break;
      case 2:
        switch(w2) {
        case 1:
          S12 = divSignals(S2, S1, "con");
          break;
        case 2:
          S12 = divSignals(S2, S2, "con");
          break;
        case 3:
          S12 = divSignals(S2, S3, "con");
          break;
        case 4:
          S12 = divSignals(S2, S4, "con");
          break;
        case 5:
          S12 = divSignals(S2, S5, "con");
          break;
        case 6:
          S12 = divSignals(S2, S6, "con");
          break;
        case 7:
          S12 = divSignals(S2, S7, "con");
          break;
        case 8:
          S12 = divSignals(S2, S8, "con");
          break;
        case 9:
          S12 = divSignals(S2, S9, "con");
          break;
        }
        break;
      case 3:
        switch(w2) {
        case 1:
          S12 = divSignals(S3, S1, "con");
          break;
        case 2:
          S12 = divSignals(S3, S2, "con");
          break;
        case 3:
          S12 = divSignals(S3, S3, "con");
          break;
        case 4:
          S12 = divSignals(S3, S4, "con");
          break;
        case 5:
          S12 = divSignals(S3, S5, "con");
          break;
        case 6:
          S12 = divSignals(S3, S6, "con");
          break;
        case 7:
          S12 = divSignals(S3, S7, "con");
          break;
        case 8:
          S12 = divSignals(S3, S8, "con");
          break;
        case 9:
          S12 = divSignals(S3, S9, "con");
          break;
        }
        break;
      case 4:
        switch(w2) {
        case 1:
          S12 = divSignals(S4, S1, "con");
          break;
        case 2:
          S12 = divSignals(S4, S2, "con");
          break;
        case 3:
          S12 = divSignals(S4, S3, "con");
          break;
        case 4:
          S12 = divSignals(S4, S4, "con");
          break;
        case 5:
          S12 = divSignals(S4, S5, "con");
          break;
        case 6:
          S12 = divSignals(S4, S6, "con");
          break;
        case 7:
          S12 = divSignals(S4, S7, "con");
          break;
        case 8:
          S12 = divSignals(S4, S8, "con");
          break;
        case 9:
          S12 = divSignals(S4, S9, "con");
          break;
        }
        break;
      case 5:
        switch(w2) {
        case 1:
          S12 = divSignals(S5, S1, "con");
          break;
        case 2:
          S12 = divSignals(S5, S2, "con");
          break;
        case 3:
          S12 = divSignals(S5, S3, "con");
          break;
        case 4:
          S12 = divSignals(S5, S4, "con");
          break;
        case 5:
          S12 = divSignals(S5, S5, "con");
          break;
        case 6:
          S12 = divSignals(S5, S6, "con");
          break;
        case 7:
          S12 = divSignals(S5, S7, "con");
          break;
        case 8:
          S12 = divSignals(S5, S8, "con");
          break;
        case 9:
          S12 = divSignals(S5, S9, "con");
          break;
        }
        break;
      case 6:
        switch(w2) {
        case 1:
          S12 = divSignals(S6, S1, "con");
          break;
        case 2:
          S12 = divSignals(S6, S2, "con");
          break;
        case 3:
          S12 = divSignals(S6, S3, "con");
          break;
        case 4:
          S12 = divSignals(S6, S4, "con");
          break;
        case 5:
          S12 = divSignals(S6, S5, "con");
          break;
        case 6:
          S12 = divSignals(S6, S6, "con");
          break;
        case 7:
          S12 = divSignals(S6, S7, "con");
          break;
        case 8:
          S12 = divSignals(S6, S8, "con");
          break;
        case 9:
          S12 = divSignals(S6, S9, "con");
          break;
        }
        break;
      case 7:
        switch(w2) {
        case 1:
          S12 = divSignals(S7, S1, "con");
          break;
        case 2:
          S12 = divSignals(S7, S2, "con");
          break;
        case 3:
          S12 = divSignals(S7, S3, "con");
          break;
        case 4:
          S12 = divSignals(S7, S4, "con");
          break;
        case 5:
          S12 = divSignals(S7, S5, "con");
          break;
        case 6:
          S12 = divSignals(S7, S6, "con");
          break;
        case 7:
          S12 = divSignals(S7, S7, "con");
          break;
        case 8:
          S12 = divSignals(S7, S8, "con");
          break;
        case 9:
          S12 = divSignals(S7, S9, "con");
          break;
        }
        break;
      case 8:
        switch(w2) {
        case 1:
          S12 = divSignals(S8, S1, "con");
          break;
        case 2:
          S12 = divSignals(S8, S2, "con");
          break;
        case 3:
          S12 = divSignals(S8, S3, "con");
          break;
        case 4:
          S12 = divSignals(S8, S4, "con");
          break;
        case 5:
          S12 = divSignals(S8, S5, "con");
          break;
        case 6:
          S12 = divSignals(S8, S6, "con");
          break;
        case 7:
          S12 = divSignals(S8, S7, "con");
          break;
        case 8:
          S12 = divSignals(S8, S8, "con");
          break;
        case 9:
          S12 = divSignals(S8, S9, "con");
          break;
        }
        break;
      case 9:
        switch(w2) {
        case 1:
          S12 = divSignals(S9, S1, "con");
          break;
        case 2:
          S12 = divSignals(S9, S2, "con");
          break;
        case 3:
          S12 = divSignals(S9, S3, "con");
          break;
        case 4:
          S12 = divSignals(S9, S4, "con");
          break;
        case 5:
          S12 = divSignals(S9, S5, "con");
          break;
        case 6:
          S12 = divSignals(S9, S6, "con");
          break;
        case 7:
          S12 = divSignals(S9, S7, "con");
          break;
        case 8:
          S12 = divSignals(S9, S8, "con");
          break;
        case 9:
          S12 = divSignals(S9, S9, "con");
          break;
        }
        break;
      }
      break;
    }
    chart(toZeroX, toZeroY);
    scatter(I2.time, I2.amp.array());
    S12.calculate();
    chart(S12.time, S12.amp.array());
  }
}

void operationTextFields() {
  PFont font;
  font = createFont("Arial", 50);
  cp6.addTextfield("wykres2")
    .setPosition(int(width*0.54), int(height*0.85))
    .setSize(int(width*0.04), int(height*0.13))
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 0, 0));
  cp6.addTextfield("operacja")
    .setPosition(int(width*0.48), int(height*0.85))
    .setSize(int(width*0.04), int(height*0.13))
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 0, 0));
  cp6.addTextfield("wykres1")
    .setPosition(int(width*0.42), int(height*0.85))
    .setSize(int(width*0.04), int(height*0.13))
    .setFont(font)
    .setFocus(true)
    .setColor(color(255, 0, 0));
}

void saveButton() {
  if (mouseX >= width*0.80 && mouseX <= width*0.88  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU ZAPISZ
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      initiateSaveToFile();
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.80, height*0.85, width*0.88, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("ZAPISZ", width*0.80, height*0.85, width*0.88, height*0.98);
}

void loadButton() {
  if (mouseX >= width*0.90 && mouseX <= width*0.98  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU WCZYTAJ
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      initiateLoadFromFile();
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.90, height*0.85, width*0.98, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("WCZYTAJ", width*0.90, height*0.85, width*0.98, height*0.98);
  textAlign(LEFT);
}

void arrowButtons() {
  if (mouseX >= width*0.60 && mouseX <= width*0.68  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU POPRZEDNI
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      if (wyborWykresu > 1) wyborWykresu--;
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.60, height*0.85, width*0.68, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("POPRZEDNI SYGNAŁ", width*0.60, height*0.85, width*0.68, height*0.98);

  if (mouseX >= width*0.70 && mouseX <= width*0.78  && mouseY >= height*0.85 && mouseY <= height*0.98) {
    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU NASTEPNY
      wasMousePressedLastFrame = true;
      buttonColor = 100;
      if (wyborWykresu < 12) wyborWykresu++;
    } else {
      buttonColor = 150;
    }
  } else buttonColor = 200;
  fill(buttonColor);
  rect(width*0.70, height*0.85, width*0.78, height*0.98, 10, 10, 10, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("NASTĘPNY SYGNAŁ", width*0.70, height*0.85, width*0.78, height*0.98);
}

//void addButton() {
//    if (mouseX >= width*0.70 && mouseX <= width*0.78  && mouseY >= height*0.85 && mouseY <= height*0.98) {
//    if (mousePressed && wasMousePressedLastFrame == false) { //KLIKNIECIE PRZYCISKU DODAJ
//      switch(wyborWykresu) {
//        case 1:
//        // wybor wykresu - aktualnie ogladane
//        // i sume zrobie
//        // zmienna jakas nowa - poprzednio ogladane
//      }
//      wasMousePressedLastFrame = true;
//      buttonColor = 100;
//    } else {
//      buttonColor = 150;
//    }
//  } else buttonColor = 200;
//  fill(buttonColor);
//  rect(width*0.50, height*0.85, width*0.58, height*0.98, 10, 10, 10, 10);
//  fill(0);
//  textAlign(CENTER, CENTER);
//  text("DODAJ SYGNAŁ", width*0.50, height*0.85, width*0.58, height*0.98);
//}

void amplitudeButton() {
  String slid1 = "amplitude";
  cp5.addSlider(slid1)
    .setBroadcast(false)
    .setPosition(20, 650)
    .setValue(USER_AMPLITUDE)
    .setRange(10, 10000)
    .setSize(200, 50)
    .setSliderMode(Slider.FLEXIBLE)
    .setBroadcast(true)
    .setColorCaptionLabel(#12FA61)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE)
    .setPaddingX(0);
}

void StaticDraw() {
  operationTextFields();
  amplitudeButton();
}

void ActiveDraw() {
  //addButton();
  loadButton();
  saveButton();
  arrowButtons();
}
