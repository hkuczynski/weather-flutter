DateTime convertDateTimeFromMillisecondsSinceEpoch(int value) {
  return DateTime.fromMillisecondsSinceEpoch(value);
}

int convertDateTimeToMillisecondsSinceEpoch(DateTime value) {
  return value.millisecondsSinceEpoch;
}
