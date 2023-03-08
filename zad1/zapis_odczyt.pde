void saveToBinaryFile(String fileName, byte[] data) {
  print("zapisuje binarnie " + fileName + "\n");
  saveBytes(fileName + ".dat", data);
}

//void saveToTextFile(String fileName, String data) {
//  print("zapisuje tekstowo");
//  saveStrings(fileName + ".txt", data);
//}

void loadFromBinaryFile(String fileName) {
  print("wczytuje binarnie " + fileName + "\n");
  byte[] loadedByteList = loadBytes(fileName + ".dat");
  loadedFloatList = float(loadedByteList);
}

void inititateSaveToFile() {
  byte[] abc = {0, 34, 5, 127, 52};
  byte[] def = byte(S1.time);
  //String ghi = (S1.time).toString();
  saveToBinaryFile(signalName, def);
  //saveToTextFile(signalName, ghi);
}

void initiateLoadFromFile() {
  loadFromBinaryFile(signalName);
  wyborWykresu = 99;
}
