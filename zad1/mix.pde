FloatList addSignals(Signal A, Signal B) {
  FloatList a1 = A.amp;
  FloatList b1 = B.amp;
  FloatList result = new FloatList();
  for (int i = 0; i < A.amp.size(); i += (A.signalE - A.signalS) / SAMPLE_NUMBER)  result.set(i, A.amp.get(i) + B.amp.get(i));
  return result;
}

FloatList subSignals(Signal A, Signal B) {
  FloatList a1 = A.amp;
  FloatList b1 = B.amp;
  FloatList result = new FloatList();
  for (int i = 0; i < A.amp.size(); i += (A.signalE - A.signalS) / SAMPLE_NUMBER)  result.set(i, A.amp.get(i) - B.amp.get(i));
  return result;
}

FloatList mulSignals(Signal A, Signal B) {
  FloatList a1 = A.amp;
  FloatList b1 = B.amp;
  FloatList result = new FloatList();
  for (int i = 0; i < A.amp.size(); i += (A.signalE - A.signalS) / SAMPLE_NUMBER)  result.set(i, A.amp.get(i) * B.amp.get(i));
  return result;
}

FloatList divSignals(Signal A, Signal B) {
  FloatList a1 = A.amp;
  FloatList b1 = B.amp;
  FloatList result = new FloatList();
  for (int i = 0; i < A.amp.size(); i += (A.signalE - A.signalS) / SAMPLE_NUMBER) {
    if ( int(B.amp.get(i)) == 0 ) result.set(i, USER_AMPLITUDE * 5);
    else result.set(i, A.amp.get(i) / B.amp.get(i));
  }
  return result;
}
