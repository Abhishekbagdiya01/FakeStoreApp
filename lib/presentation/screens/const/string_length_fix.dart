String fixLength(String inputString, int maxLength) {
  if (inputString.length <= maxLength) {
    return inputString;
  } else {
    return inputString.substring(0, maxLength);
  }
}