void saveToFile(String fileName, String[] data1, String[] data2) {
  PrintWriter output;
  output = createWriter(fileName + ".txt");
  output.println(data1.length);

  for (int i=0; i<data1.length; i++) {
    output.println(data1[i]);
  }
  for (int i=0; i<data2.length; i++) {
    output.println(data2[i]);
  }
  output.flush();
  output.close();
  println("zapisano plik" + fileName);
}

void loadFromFile(String fileName) {
  String[] file = loadStrings(fileName + ".txt");
  float[] data1 = new float[int(file[0])];
  float[] data2 = new float[int(file[0])];

  for (int i = 0; i < int(file[0]); i++) {
    data1[i] = float(file[i+1]);
  }
  for (int i = 0; i < int(file[0]); i++) {
    data2[i] = float(file[i+1+int(file[0])]);
  }

  switch(wyborWykresu) {
  case 1:
    S1.time = data1;
    for (int i=0; i<data2.length; i++) {
      S1.amp.set(i, data2[i]);
    }
    break;
  case 2:
    S2.time = data1;
    for (int i=0; i<data2.length; i++) {
      S2.amp.set(i, data2[i]);
    }
    break;
  case 3:
    S3.time = data1;
    for (int i=0; i<data2.length; i++) {
      S3.amp.set(i, data2[i]);
    }
    break;
  case 4:
    S4.time = data1;
    for (int i=0; i<data2.length; i++) {
      S4.amp.set(i, data2[i]);
    }
    break;
  case 5:
    S5.time = data1;
    for (int i=0; i<data2.length; i++) {
      S5.amp.set(i, data2[i]);
    }
    break;
  case 6:
    S6.time = data1;
    for (int i=0; i<data2.length; i++) {
      S6.amp.set(i, data2[i]);
    }
    break;
  case 7:
    S7.time = data1;
    for (int i=0; i<data2.length; i++) {
      S7.amp.set(i, data2[i]);
    }
    break;
  case 8:
    S8.time = data1;
    for (int i=0; i<data2.length; i++) {
      S8.amp.set(i, data2[i]);
    }
    break;
  case 9:
    S9.time = data1;
    for (int i=0; i<data2.length; i++) {
      S9.amp.set(i, data2[i]);
    }
    break;
  case 10:
    I1.time = data1;
    for (int i=0; i<data2.length; i++) {
      I1.amp.set(i, data2[i]);
    }
    break;
  case 11:
    I2.time = data1;
    for (int i=0; i<data2.length; i++) {
      I2.amp.set(i, data2[i]);
    }
    break;
  }
}

void initiateSaveToFile() {
  string1 = createStringList(S1.time);
  string2 = createStringList(S1.amp.array());


  switch(wyborWykresu) {
  case 1:
    string1 = createStringList(S1.time);
    string2 = createStringList(S1.amp.array());
    break;
  case 2:
    string1 = createStringList(S2.time);
    string2 = createStringList(S2.amp.array());
    break;
  case 3:
    string1 = createStringList(S3.time);
    string2 = createStringList(S3.amp.array());
    break;
  case 4:
    string1 = createStringList(S4.time);
    string2 = createStringList(S4.amp.array());
    break;
  case 5:
    string1 = createStringList(S5.time);
    string2 = createStringList(S5.amp.array());
    break;
  case 6:
    string1 = createStringList(S6.time);
    string2 = createStringList(S6.amp.array());
    break;
  case 7:
    string1 = createStringList(S7.time);
    string2 = createStringList(S7.amp.array());
    break;
  case 8:
    string1 = createStringList(S8.time);
    string2 = createStringList(S8.amp.array());
    break;
  case 9:
    string1 = createStringList(S9.time);
    string2 = createStringList(S9.amp.array());
    break;
  case 10:
    string1 = createStringList(I1.time);
    string2 = createStringList(I1.amp.array());
    break;
  case 11:
    string1 = createStringList(I2.time);
    string2 = createStringList(I2.amp.array());
    break;
  }

  saveToFile(signalName, string1, string2);
}

void initiateLoadFromFile() {
  loadFromFile(signalName);
}



String[] createStringList(float[] data) {
  String[] result = new String[data.length];

  for (int i=0; i<data.length; i++) {
    result[i] = str(data[i]);
  }

  return result;
}
