void saveToBinaryFile(String fileName, byte[] data) {
  print("zapisuje binarnie " + fileName + "\n");
  saveBytes(fileName + ".dat", data);
}

void saveToTextFile(String fileName, String data) {
  print("zapisuje tekstowo");
  saveStrings(fileName + ".txt", data);
}

void loadFromBinaryFile(String fileName) {
  print("wczytuje binarnie " + fileName + "\n");
  byte[] loadedByteList = loadBytes(fileName + ".dat");
  S1.time = float(loadedByteList);
  loadedFloatList = float(loadedByteList);
}

void inititateSaveToFile() {
  String floatListAsString = createStringList(S1.time);
  saveToTextFile(signalName);
}

void initiateLoadFromFile() {
  loadFromBinaryFile(signalName);
  wyborWykresu = 99;
}

String createStringList(float[] data) {
  String[data.length] result;
  
  for(int i=0; i<data.length; i++) {
    result[i] = data[i];
  }
  
  return result;
}
