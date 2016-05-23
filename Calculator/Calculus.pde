double integrate(double a, double b, String e, char d) {
  double s=0;
  double x=0;
  String y="";
  for (int i=1; i<1000000; i++) {
    x=a+(b-a)/1000000*i;
    for (int j=0; j<e.length(); j++) {
      if (e.charAt(j)==d) {
        y+=x;
      } else {
        y+=e.charAt(j);
      }
    }
    s+=evaluate(y);
    y="";
  }
  return s;
}

double differentiate(char d, String e, double a) {
  String y="";
  double s;
  for (int i=0; i<e.length(); i++) {
    if (e.charAt(i)==d) {
      y+=a+.000001;
    } else {
      y+=e.charAt(i);
    }
  }
  s=evaluate(y);
  y="";
  for (int i=0; i<e.length(); i++) {
    if (e.charAt(i)==d) {
      y+=a-.000001;
    } else {
      y+=e.charAt(i);
    }
  }
  s-=evaluate(y);
  return s/.000002;
}