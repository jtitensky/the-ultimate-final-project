public class Matricies {

  Matricies() {
  }     

  Basic b2 = new Basic();

  int wToWriteX, wToWriteY;
  int wR = -1;
  int wC = -1;
  int wM = -1;
  int r1 = 2;
  int c1 = 2; 
  double[][] m1 = new double[r1][c1];
  int r2 = 2;
  int c2 = 2;
  double[][] m2 = new double[r2][c2];

  void create() {
    background(100, 87, 75);
    PFont f = createFont("Comic Sans MS Bold", 48); //HATERS GONNA HATE, BUT COMIC SANS IS LOVE, COMIC SANS IS LIFE, //...
    textFont(f, 48);
    textSize(30);
    fill(222, 218, 215);
    textAlign(LEFT);
    text("M1", 30, 40);
    text("M2", 30, 335);
    text("X", 140, 335);
    text("X", 140, 40);
    text("D: "+determinant(m1), 240, 40);
    text("D: "+determinant(m2), 240, 335);
    text("[", 10, 74);
    text("[", 10, 369);
    r(90, 13, 40, 30, 5, color(234, 162, 102));
    r(170, 13, 40, 30, 5, color(234, 162, 102));
    r(90, 308, 40, 30, 5, color(234, 162, 102));
    r(170, 308, 40, 30, 5, color(234, 162, 102));
    fill(222, 218, 215);
    textAlign(LEFT);
    textSize(25);
    text(r1+"", 102, 38);
    text(c1+"", 182, 38);
    text(r2+"", 102, 333);
    text(c2+"", 182, 333);

    for (int i = 0; i < r1; i++) {
      for (int j = 0; j < c1; j++) {
        r(33+(70)*i, 49+(40)*j, 60, 30, 5, color(234, 162, 102));
        fill(222, 218, 215);
        textAlign(LEFT);
        textSize(18);
        text(m1[i][j]+"", 37+(70)*i, 72+(40)*j);
      }
    }
    for (int i = 0; i < r2; i++) {
      for (int j = 0; j < c2; j++) {
        r(33+(70)*i, 346+(40)*j, 60, 30, 5, color(234, 162, 102));
        fill(222, 218, 215);
        textAlign(LEFT);
        textSize(18);
        text(m2[i][j]+"", 37+(70)*i, 369+(40)*j);
      }
    }
    fill(222, 218, 215);
    textSize(30);
    text("]", 33+70*r1, 45+(40)*c1-9);
    text("]", 33+70*r2, 346+(40)*c2-13);

    /*
    double[][] x=new double[3][3];
     x[0][0]=5;
     x[0][1]=4;
     x[0][2]=9;
     x[1][0]=8;
     x[1][1]=0;
     x[1][2]=6;
     x[2][0]=-2;
     x[2][1]=6;
     x[2][2]=7;
     System.out.println("D "+determinant(x));
     */
  }

  void mClick() {
    for (int i = 0; i < r1; i++) {
      for (int j = 0; j < c1; j++) {
        if (mouseX>33+70*i && mouseX<93+70*i && mouseY>49+40*j && mouseY<79+40*j) {
          create();
          writing = true;
          r(33+(70)*i, 49+(40)*j, 60, 30, 5, color(185, 191, 235));
          wToWriteX = 52+70*i;
          wToWriteY = 72+40*j;
          wR = i;
          wC = j;
          wM = 0;
          i = 2*1000;
          j= 2*1000;
        }
      }
    }
    for (int i = 0; i < r2; i++) {
      for (int j = 0; j < c2; j++) {
        if (mouseX>33+70*i && mouseX<93+70*i && mouseY>346+40*j && mouseY<376+40*j) {
          create();
          r(33+(70)*i, 346+(40)*j, 60, 30, 5, color(185, 191, 235));
          wToWriteX = 50+70*i;
          wToWriteY = 369+40*j;
          wR = i;
          wC = j;
          wM = 1;
          i = 2*1000;
          j= 2*1000;
        }
      }
    }
    if (mouseX>90 && mouseX<130 && mouseY>13 && mouseY<43) {
      create();
      r(90, 13, 40, 30, 5, color(185, 191, 235));
      wToWriteX = 102;
      wToWriteY = 38;
    }
    if (mouseX>170 && mouseX<210 && mouseY>13 && mouseY<43) {
      create();
      r(170, 13, 40, 30, 5, color(185, 191, 235));
      wToWriteX = 182;
      wToWriteY = 38;
    }
    if (mouseX>90 && mouseX<130 && mouseY>308 && mouseY<338) {
      create();
      r(90, 308, 40, 30, 5, color(185, 191, 235));
      wToWriteX = 102;
      wToWriteY = 333;
    }
    if (mouseX>170 && mouseX<210 && mouseY>308 && mouseY<338) {
      create();
      r(170, 308, 40, 30, 5, color(185, 191, 235));
      wToWriteX = 182;
      wToWriteY = 333;
    }
  }

  void print(double[][] a) {
    String s="";
    for (int i=0; i<a.length; i++) {
      for (int j=0; j<a[0].length; j++) {
        s+=" "+a[i][j];
      }
      System.out.println(s);
      s="";
    }
  }

  void write() {
    textAlign(LEFT);
    if (writing) {
      if (key==ENTER || key==RETURN) {
        if (wR!=-1 && wC!=-1) {
          if (wM==0) {
            m1[wR][wC] = b2.evaluate(written);
          } else {
            m2[wR][wC] = b2.evaluate(written);
          }
          wR = -1;
          wC = -1;
          wM = -1;
        }
        written = "";
        create();
      } else {
        if (key==BACKSPACE && written.length()>0) {
          written=written.substring(0, written.length()-1);
        } else if (b2.valid(key)) {
          written+=key;
        }
      }

      if (wR!=-1 && wC!=-1) {
        if (wM==0) {
          r(33+(70)*wR, 49+(40)*wC, 60, 30, 5, color(185, 191, 235));
        } else {
          r(33+(70)*wR, 346+(40)*wC, 60, 30, 5, color(185, 191, 235));
        }
      }
      textSize(18);
      fill(0);
      text(written, wToWriteX-13, wToWriteY);
    }
  }


  double[][] add(double[][] a, double[][] b) {
    if (a.length!=b.length || a[0].length!=b[0].length) {
      throw new IllegalArgumentException();
    }
    double[][] c=new double[a.length][a[0].length];
    for (int i=0; i<c.length; i++) {
      for (int j=0; i<c[0].length; j++) {
        c[i][j]=a[i][j]+b[i][j];
      }
    }
    return c;
  }

  double[][] multiply(double[][] a, double[][] b) {
    if (a[0].length!=b.length) {
      throw new IllegalArgumentException();
    }
    double[][] c =new double[a.length][b[0].length];
    for (int i=0; i<c.length; i++) {
      for (int j=0; j<c[0].length; j++) {
        c[i][j]=0;
        for (int k=0; k<b.length; k++) {
          c[i][j]=c[i][j]+a[i][k]*b[k][j];
        }
      }
    }
    return c;
  }

  double[][] transpose(double[][] a) {
    double[][] c=new double[a[0].length][a.length];
    for (int i=0; i<a.length; i++) {
      for (int j=0; j<a[0].length; j++) {
        c[j][i]=a[i][j];
      }
    }
    return c;
  }

  double determinant(double[][] a) {
    if (a.length!=a[0].length) {
      throw new IllegalArgumentException();
    }
    if (a.length==1) {
      return a[0][0];
    }
    if (a.length==2) {
      return a[0][0]*a[1][1]-a[0][1]*a[1][0];
    }
    double s=0;
    for (int i=0; i<a.length; i++) {
      double[][] b=new double[a.length-1][a.length-1];
      ArrayList<Double> c=new ArrayList<Double>();
      for (int j=0; j<a.length; j++) {
        for (int k=0; k<a.length; k++) {
          if (j!=i&&k!=0) {
            c.add(a[j][k]);
            System.out.println("i"+i+" j"+j+" k"+k);
          }
        }
      }
      System.out.println("c"+c);
      int x=0;
      for (int j=0; j<b.length; j++) {
        for (int k=0; k<b.length; k++) {
          b[j][k]=c.get(x);
          x++;
        }
      }
      print(b);
      System.out.println(a[i][0]);
      System.out.println();
      s+=(a[i][0]*determinant(b))*Math.pow(-1, i);
    }
    return s;
  }
}