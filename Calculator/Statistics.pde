
public class Statistics {

  ArrayList<Double> data1;
  ArrayList<Double> data2;
  double[][] entries;
  String written;
  int col;
  int row;
  boolean writing;
  boolean x;
  boolean y;
  boolean z;
  boolean gingp;

  Statistics() {
    data1=new ArrayList<Double>();
    data2=new ArrayList<Double>();
    entries=new double[15][2];
    for (int i=0; i<15; i++) {
      for (int j=0; j<2; j++) {
        entries[i][j]=(double)(Integer.MAX_VALUE);
      }
    }
    written="";
    writing=false;
    x=y=z=false;
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

  void create() {
    background(100, 87, 75);
    r(540, 570, 50, 20, 5, color(235, 162, 102));
    fill(0);
    textSize(15);
    textAlign(LEFT);
    text("BACK", 544, 585);
    stroke(234, 162, 102);
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
    fill(222, 218, 215);
    text("X", 35, 40);
    text("Y", 100, 40);
    textAlign(LEFT);
    for (int i=0; i<15; i++) {
      for (int j=0; j<2; j++) {
        if (entries[i][j]!=Integer.MAX_VALUE) {
          text(""+entries[i][j], 10+70*j+2, 48+39*i+30);
        }
      }
    }
    fill(234, 162, 102);
    rect(175, 30, 160, 30, 5);
    rect(400, 30, 160, 30, 5);
    rect(275, 340, 165, 30, 5);
    textSize(20);
    fill(0);
    text("X-Stats", 220, 55);
    text("Y-Stats", 440, 55);
    text("Linear Regression", 280, 365);

    if (x) {
      go();
      if (data1.size()>0) {
        String s="";
        fill(222, 218, 215);
        textAlign(LEFT);
        textSize(17);
        double[] q=quartiles(data1);
        s+="mean: "+mean(data1)+"\n";
        s+="min: "+q[0]+"\n";
        s+="first quatile: "+q[1]+"\n";
        s+="median: "+q[2]+"\n";
        s+="third quartile: "+q[3]+"\n";
        s+="max: "+q[4]+"\n";
        if (mode(data1).size()>0) {
          s+="mode: "+mode(data1)+"\n";
        } else {
          s+="mode: NaN\n";
        }
        s+="range: "+range(data1)+"\n";
        s+="sample stan dev: "+"\n   "+sampleSD(data1)+"\n";
        s+="population stan dev: "+"\n   "+populationSD(data1)+"\n";
        text(s, 170, 100);
      }
    }
    if (y) {
      go();
      if (data2.size()>0) {
        String s="";
        fill(222, 218, 215);
        textAlign(LEFT);
        textSize(17);
        double[] q=quartiles(data2);
        s+="mean: "+mean(data2)+"\n";
        s+="min: "+q[0]+"\n";
        s+="first quatile: "+q[1]+"\n";
        s+="median: "+q[2]+"\n";
        s+="third quartile: "+q[3]+"\n";
        s+="max: "+q[4]+"\n";
        if (mode(data2).size()>0) {
          s+="mode: "+mode(data2)+"\n";
        } else {
          s+="mode: NaN\n";
        }
        s+="range: "+range(data2)+"\n";
        s+="sample stan dev: "+"\n   "+sampleSD(data2)+"\n";
        s+="population stan dev: "+"\n   "+populationSD(data2)+"\n";
        text(s, 400, 100);
      }
    }
    if (z) {
      go();
      if (data1.size()>0&&data2.size()>0) {
        boolean t=true;
        for (int i=0; i<15; i++) {
          if ((entries[i][0]==Integer.MAX_VALUE&&entries[i][1]!=Integer.MAX_VALUE)||(entries[i][0]!=Integer.MAX_VALUE&&entries[i][1]==Integer.MAX_VALUE)) {
            t=false;
          }
        }
        if (t) {
          double[] x=linearRegression(data1, data2);
          String s="";
          s+="y="+x[0]+"x+"+x[1]+"\n";
          s+="correlation coefficient: "+x[2]+"\n";
          s+="coefficient of determination: "+x[3];
          fill(222, 218, 215);
          textAlign(CENTER);
          textSize(18);
          text(s, 350, 400);
        } else {
          fill(0);
          textAlign(CENTER);
          textSize(18);
          text("enter corresponding values for x & y", 350, 400);
        }
      }
    }
  }

  void mClick() {
    //if(    r(540, 570, 50, 20, 5, color(235, 162,102));
    if (mouseX>540 && mouseX < 590 && mouseY>570 && mouseY< 590) {
      state = ' ';
    }
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

    if (175<mouseX&&mouseX<175+160&&30<mouseY&&mouseY<30+30) {
      x=true;
      create();
    }
    if (400<mouseX&&mouseX<400+160&&30<mouseY&&mouseY<30+30) {
      y=true;
      create();
    }
    if (275<mouseX&&mouseX<275+165&&330<mouseY&&mouseY<330+30) {
      z=true;
      create();
    }
    written = "";
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
        text(written, 10+70*col+2, 48+39*row+30);
        written="";
      }
      if (key==BACKSPACE) {
        if (written.length()>0) {
          written=written.substring(0, written.length()-1);
          fill(222, 218, 215);
          rect(5+70*col, 48+39*row, 70, 39);
          fill(34, 119, 240);
          text(written, 10+70*col+2, 48+39*row+30);
        }
      }
      if (key=='0'||key=='1'||key=='2'||key=='3'||key=='4'||key=='5'||key=='6'||key=='7'||key=='8'||key=='9'||key=='.') {
        written+=key;
        fill(222, 218, 215);
        rect(5+70*col, 48+39*row, 70, 39);
        fill(34, 119, 240);
        text(written, 10+70*col+2, 48+39*row+30);
      }
    }
    System.out.println("Sfsaf "+entries[1][1]);
  }

  void go() {
    data1=new ArrayList<Double>();
    for (int i=0; i<15; i++) {
      if (entries[i][0]!=Integer.MAX_VALUE) {
        data1.add(entries[i][0]);
      }
    }
    data2=new ArrayList<Double>();
    for (int i=0; i<15; i++) {
      if (entries[i][1]!=Integer.MAX_VALUE) {
        data2.add(entries[i][1]);
      }
    }
  }



  double median(ArrayList<Double> d, int s, int e) {
    if ((e-s)%2==0) {
      return d.get((e+s)/2);
    } else {
      return (d.get((e+s-1)/2)+d.get((e+s+1)/2))*1.0/2;
    }
  }

  double range(ArrayList<Double> d) {
    double min=d.get(0);
    double max=d.get(0);
    for (int i=0; i<d.size(); i++) {
      if (d.get(i)<min) {
        min=d.get(i);
      }
      if (d.get(i)>max) {
        max=d.get(i);
      }
    }
    return max-min;
  }

  ArrayList<Double> mode(ArrayList<Double> d) {
    int bc=1;
    ArrayList<Double> b=new ArrayList<Double>();
    for (int i=0; i<d.size(); i++) {
      int m=0;
      for (int j=0; j<d.size(); j++) {
        System.out.println("i"+i+"j"+j);
        if (d.get(i).equals(d.get(j))) {
          System.out.println(d);
          m++;
        }
        System.out.println("m"+m);
      }
      if (m>bc) {
        bc=m;
      }
    }
    System.out.println("bc "+bc);
    for (int i=0; i<d.size(); i++) {
      int m=0;
      for (int j=0; j<d.size(); j++) {
        if (d.get(i).equals(d.get(j))) {
          m++;
        }
      }
      if (m==bc&&m!=1&&b.indexOf(d.get(i))==-1) {
        b.add(d.get(i));
      }
    }
    return b;
  }



  double[] quartiles(ArrayList<Double> d) {
    ArrayList<Double> dd= new ArrayList<Double>();
    for (int i=0; i<d.size(); i++) {
      dd.add(d.get(i));
    }
    Collections.sort(dd);
    double[] q=new double[5];
    q[0]=dd.get(0);
    if (dd.size()%2==0) {
      if (dd.size()==2) {
        q[1]=dd.get(0);
        q[3]=dd.get(1);
      } else {
        q[1]=median(dd, 0, dd.size()/2);
        q[3]=median(dd, dd.size()/2+1, dd.size()-1);
      }
    } else {
      if (dd.size()==1) {
        q[1]=dd.get(0);
        q[3]=dd.get(0);
      } else {
        q[1]=median(dd, 0, dd.size()/2-1);
        q[3]=median(dd, dd.size()/2+1, dd.size()-1);
      }
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