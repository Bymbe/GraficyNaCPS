void saveToBinaryFile(String fileName, byte[] data) {
  println("zapisuje binarnie " + fileName);
  saveBytes(fileName + ".dat", data);
}

void saveToTextFile(String fileName, String[] data) {
  println("zapisuje tekstowo");
  saveStrings(fileName + ".txt", data);
  saveStrings(fileName + ".txt", data);
}

void saveToFile(String fileName, String[] data) {
  PrintWriter output;
  output = createWriter(fileName + ".txt");
  output.println(data.length);
  for(int i=0; i<data.length; i++) {
    output.println(data[i]);
  }
  output.flush();
  output.close();
}

void loadFromBinaryFile(String fileName) {
  print("wczytuje binarnie " + fileName + "\n");
  byte[] loadedByteList = loadBytes(fileName + ".dat");
  S1.time = float(loadedByteList);
  loadedFloatList = float(loadedByteList);
}

void inititateSaveToFile() {
  String[] floatListAsString = createStringList(S1.time);
  //saveToTextFile(signalName, floatListAsString);
  saveToFile(signalName, floatListAsString);
}

void initiateLoadFromFile() {
  loadFromBinaryFile(signalName);
  wyborWykresu = 99;
}



String[] createStringList(float[] data) {
  String[] result = new String[data.length];

  for (int i=0; i<data.length; i++) {
    result[i] = str(data[i]);
  }

  return result;
}
