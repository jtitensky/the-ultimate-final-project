
public class Statistics {

  ArrayList<Double> data1;
  ArrayList<Double> data2;
  double[][] entries;
  String written;
  int col;
  int row;
  boolean writing;

  Statistics() {
    data1=new ArrayList<Double>();
    data2=new ArrayList<Double>();
    entries=new double[15][2];
    written="";
    writing=false;
  }


  void create() {
    background(147, 227, 93);
    stroke(34, 119, 240);
    strokeWeight(4);
    line(5, 5, 5, 595);
    line(145, 5, 145, 595);
    line(5, 5, 145, 5);
    line(5, 595, 145, 595);
    strokeWeight(2);
    line(75, 5, 75, 595);
    for (int i=0; i<15; i++) {
      line(5, 48+39*i, 145, 48+39*i);
    }
    fill(34, 119, 240);
    text("X", 40, 40);
    text("Y", 110, 40);
    textAlign(LEFT);
    for (int i=0; i<15; i++) {
      for (int j=0; j<2; j++) {
        text(""+entries[i][j], 5+70*j+2, 48+39*i+30);
      }
    }
  }

  void mClick() {
    System.out.println(mouseX+"   "+mouseY);
    for (int y=0; y<15; y++) {
      if (48+39*y<mouseY&&mouseY<48+39+39*y) {
        for (int x=0; x<2; x++) {
          if (5+70*x<mouseX&&mouseX<5+70+70*x) {
            fill(163, 217, 182);
            rect(5+70*x, 48+39*y, 70, 39);
            col=x;
            row=y;
            writing=true;
          }
        }
      }
    }
  }

  void write() {
    if (writing) {
      textAlign(LEFT);
      if (key==ENTER||key==RETURN) {
        writing=false;
        if (written.length()>0) {
          entries[row][col]=Double.parseDouble(written);
        }
        fill(147, 227, 93);
        rect(5+70*col, 48+39*row, 70, 39);
        fill(34, 119, 240);
        text(written, 5+70*col+2, 48+39*row+30);
        written="";
      }
      if (key==BACKSPACE) {
        if (written.length()>0) {
          written=written.substring(0, written.length()-1);
          fill(163, 217, 182);
          rect(5+70*col, 48+39*row, 70, 39);
          fill(34, 119, 240);
          text(written, 5+70*col+2, 48+39*row+30);
        }
      }
      if (key=='0'||key=='1'||key=='2'||key=='3'||key=='4'||key=='5'||key=='6'||key=='7'||key=='8'||key=='9'||key=='.') {
        written+=key;
        fill(163, 217, 182);
        rect(5+70*col, 48+39*row, 70, 39);
        fill(34, 119, 240);
        text(written, 5+70*col+2, 48+39*row+30);
      }
    }
    System.out.println("Sfsaf "+entries[1][1]);
  }




  double median(ArrayList<Double> d, int s, int e) {
    if ((e-s)%2==0) {
      return d.get((e+s)/2);
    } else {
      return (d.get((e+s-1)/2)+d.get((e+s+1)/2))*1.0/2;
    }
  }

  double[] quartiles(ArrayList<Double> d) {
    ArrayList<Double> dd= new ArrayList<Double>();
    for (int i=0; i<d.size(); i++) {
      dd.add(d.get(i));
    }
    Collections.sort(dd);
    double[] q=new double[5];
    q[0]=dd.get(1);
    if (dd.size()%2==0) {
      q[1]=median(dd, 0, dd.size()/2);
      q[3]=median(dd, dd.size()/2+1, dd.size()-1);
    } else {
      q[1]=median(dd, 0, dd.size()/2-1);
      q[3]=median(dd, dd.size()/2+1, dd.size()-1);
    }
    q[2]=median(dd, 0, dd.size()-1);
    q[4]=dd.get(dd.size()-1);
    return q;
  }

  double mean(ArrayList<Double> d) {
    double s=0;
    for (int i=0; i<d.size(); i++) {
      s+=d.get(i);
    }
    return s/d.size();
  }

  double populationSD(ArrayList<Double> d) {
    double m=mean(d);
    double s=0;
    for (int i=0; i<d.size(); i++) {
      s+=Math.pow(d.get(i)-m, 2);
    }
    return Math.pow(s/d.size(), .5);
  }

  double sampleSD(ArrayList<Double> d) {
    double m=mean(d);
    double s=0;
    for (int i=0; i<d.size(); i++) {
      s+=Math.pow(d.get(i)-m, 2);
    }
    return Math.pow(s/(d.size()-1), .5);
  }

  double[] linearRegression(ArrayList<Double> x, ArrayList<Double> y) {
    if (x.size()!=y.size()) {
      throw new IllegalArgumentException();
    }
    double n=x.size();
    double sx1=0;
    double sy1=0;
    double sxy=0;
    double sx2=0;
    double sy2=0;
    for (int i=0; i<n; i++) {
      sx1+=x.get(i);
      sy1+=y.get(i);
      sxy+=x.get(i)*y.get(i);
      sx2+=x.get(i)*x.get(i);
      sy2+=y.get(i)*y.get(i);
    }
    double r=(n*sxy-sx1*sy1)/Math.pow(n*sx2-sx1*sx1, .5)/Math.pow(n*sy2-sy1*sy1, .5);
    double m=(n*sxy-sx1*sy1)/(n*sx2-sx1*sx1);
    double b=(sy1-m*sx1)/n;
    double[] s=new double[4];
    s[0]=m;
    s[1]=b;
    s[2]=r;
    s[3]=r*r;
    return s;
    //[slope, y intercept, correlation coefficient, coefficient of determination]
  }
}