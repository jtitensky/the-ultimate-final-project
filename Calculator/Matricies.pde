public class Matricies {

  Matricies() {
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
      for (int j=0; j<c[0].length;j++) {
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
}