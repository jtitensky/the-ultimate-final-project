public class Statistics {

  ArrayList<Double> data1;
  ArrayList<Double> data2;

  Statistics() {
    data1=new ArrayList<Double>();
    data2=new ArrayList<Double>();
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
  }

  double mean(ArrayList<Double> d) {
    double s=0;
    for (int i=0; i<d.size()i++) {
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
      throw new IllegalOperationException();
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
    double b=(sy1-m*sx1)/n
      double[] s=new double[4];
    s[0]=m;
    s[1]=b;
    s[2]=r;
    s[3]=r*r;
    return s;
    //[slope, y intercept, correlation coefficient, coefficient of determination]
  }
}