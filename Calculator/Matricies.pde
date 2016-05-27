public class Matricies {

  Matricies() {
  }     

  void create() {
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