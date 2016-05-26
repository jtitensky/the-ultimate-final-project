public class Calculus {

  Calculus() {
  }

  Basic b2=new Basic();

  void create() {
    background(55, 219, 189);
    fill(48, 71, 242);
    PFont f = createFont("Comic Sans MS Bold", 48); //HATERS GONNA HATE, BUT COMIC SANS IS LOVE, COMIC SANS IS LIFE, //...
    textFont(f, 48);
    textSize(45);
    textAlign(CENTER);
    text("∫", 300, 150);
    r(100, 180, 400, 50, 5, color(91, 108, 235));
    for (int i=1; i<9; i++) {
      System.out.println("d "+i+differentiate('x', "e^x", 1.0, i));
    }
  }



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
      s+=b2.evaluate(y);
      y="";
    }
    return s*(b-a)/1000000;
  }

  double differentiate(char d, String e, double a, int n) {
    String y="";
    double s;
    if (n==1) {
      for (int i=0; i<e.length(); i++) {
        if (e.charAt(i)==d) {
          y+=a+.000001;
        } else {
          y+=e.charAt(i);
        }
      }
      s=b2.evaluate(y);
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
    } else {
      return (differentiate(d, e, a+.1, n-1)-differentiate(d, e, a-.1, n-1))/2/.1;
    }
  }
}