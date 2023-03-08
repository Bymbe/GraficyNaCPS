void saveToFile(String fileName, String[] data1, String[] data2) {
  PrintWriter output;

  output = createWriter(fileName + ".txt");
  output.println(data1.length);
  for (int i=0; i<data1.length; i++) {
    output.println(data1[i]);
  }
  output.println(data2.length);
  for (int i=0; i<data2.length; i++) {
    output.println(data2[i]);
  }
  output.flush();
  output.close();
}

void loadFromFile(String fileName) {
  String[] file = loadStrings(fileName + ".txt");
  
  float[] data1 = new float[int(file[0])];
  for (int i=0; i<int(file[0]); i++) {
    data1[i]=float(file[i+1]);
  }
  
  float[] data2 = new float[int(file[int(file[0])])];
  for (int i=0; i<int(file[int(file[0])]); i++) {
    data2[i]=float(file[i+1+int(file[0])]);
  }
  
  S2.time = data1;
  for(int i=0; i<data2.length; i++) {
    S2.amp.set(i, data2[i]);
  }
}

void inititateSaveToFile() {
  String[] string1 = createStringList(S1.time);
  String[] string2 = createStringList(S1.amp.array());

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
