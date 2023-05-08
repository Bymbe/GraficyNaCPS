float[] wykonajSplot(float[] sygnalA, float[] sygnalB) {
  int dlugoscA = sygnalA.length;
  int dlugoscB = sygnalB.length;
  int dlugoscWyniku = dlugoscA + dlugoscB - 1; // Długość wynikowej tablicy splotu

  float[] wynik = new float[dlugoscWyniku]; // Tablica wynikowa

  // Wykonaj splot
  for (int i = 0; i < dlugoscWyniku; i++) {
    wynik[i] = 0; // Zeruj wartość dla każdej próbki wynikowej

    for (int j = 0; j < dlugoscA; j++) {
      if (i - j >= 0 && i - j < dlugoscB) {
        // Pomnóż odpowiadające próbki sygnałów A i B oraz dodaj do wyniku
        wynik[i] += sygnalA[j] * sygnalB[i - j];
      }
    }
  }

  return wynik; // Zwróć tablicę wynikową splotu
}

float[] podwojnyczas(float[] sygnalA, float[] sygnalB) {
  int dlugoscA = sygnalA.length;
  int dlugoscB = sygnalB.length;
  int dlugoscWyniku = dlugoscA + dlugoscB - 1; // Długość wynikowej tablicy splotu
  
  float[] nowySyg = new float[dlugoscWyniku];
  for(int i = 0; i<dlugoscWyniku; i++){
    nowySyg[i] = map(i, 0, dlugoscWyniku, 0, SIGNAL_END);
  }
  return nowySyg;
}
