//wybor zadania
int numerZadania = 3; //1-4

//kolor przycisku
int buttonColor = 200;

//sploty
Boolean isConvolutionVisible = false;
int convSignalChoice1 = 3;
int convSignalChoice2 = 5;
float convSignal2Percent = 0.5;
float[] convSignalAmp;
float[] convSignalTime;
float[] tempPreConvSignal1;
float[] tempPreConvSignal2;

//flagi wykresow
boolean activeWriting = false;
Boolean showBarChart = false;
Boolean showLineChart = false;

//Zmienne bibliotek rysujacych
XYChart lineChart;
XYChart scatterplot;
BarChart barChart;
XYChart reconstructedChart;
ControlP5 cp5, cp6;

//Zmienne dla uzytkownika
float USER_AMPLITUDE = 10; //amplituda
float USER_PERIOD = 2; //okres podstawowy dla sygnalow z okresem
float SIGNAL_START = 0.0; //poczatek sygnalu w sekundach
float SIGNAL_END = 10.0; //koniec sygnalu w sekundach
float FILL_FACTOR = 0.5; //wspolczynnik wypelnienia
float IMPULSE_FREQUENCY = 1000;
float IMPULSE_PROBABILITY = 0.25;
float QUANTIZATION_JUMP_SIZE = 2; //skok pionowy
float[] startEndAmp = {SIGNAL_START, SIGNAL_END, USER_AMPLITUDE}; //poczatek i koniec sygnalu oraz amplituda
int IMPULSE_NOISETIME = 50;
int SAMPLE_NUMBER = 500; //liczba probek
int RECONSTRUCTED_SAMPLE_NUMBER = 50;
int SAMPLE_RATE = 10;
int IMPULSE_AMPLITUDE = 10;
int IMPULSE_FIRSTSAMPLE = 25;
int IMPULSE_JUMPSAMPLE = 0;

//zmienne pomocnicze, przechowujace dane dynamicznei
float recTime[];
float recAmpl[];
float recOnlyValues[];
float[] calc1, calc2;
float[] calcResult = new float[SAMPLE_NUMBER];
float[] calcTime = new float[SAMPLE_NUMBER];

//flagi, tablice czyszczące
String signalType;
String impulsType;
String signalName;
String[] string1;
String[] string2;
String wykres1String, operacjaString, wykres2String; // zmienne do operacji na sygnalach
boolean isItSignalOrImpulse = true; // flaga okreslajaca czy wyswietalmy signaly czy impuls aby podmienic tekst w ui
boolean wasMousePressedLastFrame = false;
float[] toZeroX = {0, 0}; // pomocniczna tablica do wyzerowania wykresu, aby poprzedni nie chodzil na naastepny // tablica osi X
float[] toZeroY = {0, 0}; // -||- tablica osi Y
float[] loadedFloatList;
int w1, op, w2; // ^^ w formie intow

//wyborowe
int wyborWykresu = 3;
Boolean isReconstructionChartVisible = false;
int reconstructionChoice = 1;
String reconstructionType;

//sygnaly
Signal S0;

ContinuosSignal S1 = new ContinuosSignal(startEndAmp);
Gauss S2 = new Gauss(startEndAmp, 0, 1); //startEndAmp, srednia, odchylenie
Sinusoidal S3 = new Sinusoidal(startEndAmp, USER_PERIOD); //startEndAmp, okres, term
RectifiedOneSinusoidal S4 = new RectifiedOneSinusoidal(startEndAmp, USER_PERIOD); //startEndAmp, okres
RectifiedTwoSinusoidal S5 = new RectifiedTwoSinusoidal(startEndAmp, USER_PERIOD); //startEndAmp, okres
Rectangular S6 = new Rectangular(startEndAmp, USER_PERIOD, FILL_FACTOR); //startEndAmp, okres, wspolczynnik wypelnienia
SymmetricalRectangular S7 = new SymmetricalRectangular(startEndAmp, USER_PERIOD, FILL_FACTOR); //startEndAmp, okres, wspolczynnik wypelnienia
Triangular S8 = new Triangular(startEndAmp, USER_PERIOD, FILL_FACTOR); //startEndAmp, okres, wspolczynnik wypelnienia
UnitStroke S9 = new UnitStroke(startEndAmp, USER_PERIOD); //startEndAmp

UnitImpulse I1 = new UnitImpulse(IMPULSE_FREQUENCY, USER_AMPLITUDE, IMPULSE_FIRSTSAMPLE, IMPULSE_JUMPSAMPLE);
NoiseImpulse I2 = new NoiseImpulse(IMPULSE_FREQUENCY, USER_AMPLITUDE, FILL_FACTOR, IMPULSE_NOISETIME);
