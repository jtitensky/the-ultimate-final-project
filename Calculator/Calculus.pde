public class Calculus {

  Calculus() {
  }

  Basic b2=new Basic();

  void blah() {
    System.out.println(differentiate('x', "x^2-2*x", 3.0));
    fill(0, 0, 0);
    line(500, 500, 550, 550);
  }

  double integrate(double a, double b, String e, char d) {
    double s=0;
    double x=0;
    String y="";
    for (int i=1; i<100000; i++) {
      x=a+(b-a)/100000*i;
      for (int j=0; j<e.length(); j++) {
        if (e.charAt(j)==d) {
          y+=x;
        } else {
          y+=e.charAt(j);
        }
      }
      s+=b2.evaluate(y);
      y="";
    }
    return s*(b-a)/100000;
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
    System.out.println(y);
    s=b2.evaluate(y);
    System.out.println(s);
    y="";
    for (int i=0; i<e.length(); i++) {
      if (e.charAt(i)==d) {
        y+=a-.000001;
      } else {
        y+=e.charAt(i);
      }
    }
    s-=b2.evaluate(y);
    return s/.000002;
  }
}