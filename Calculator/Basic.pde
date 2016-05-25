class Basic {

  Basic() {
  }

  void create() {
    background(55, 219, 189);
    fill(48, 71, 242);
    PFont f = createFont("Comic Sans MS Bold", 48); //HATERS GONNA HATE, BUT COMIC SANS IS LOVE, COMIC SANS IS LIFE, //...
    textFont(f, 48);
    textSize(45);
    textAlign(CENTER);
    text("Enter an expression", 300, 150);
    r(100, 180, 400, 50, 5, color(91, 108, 235));
  }

  boolean mouseOnBox() {
    return 100<mouseX && mouseX<500 && 180<mouseY && mouseY<230;
  }

  String result() {
    try {
      return ""+evaluate(written);
    }
    catch(IllegalArgumentException e) {
      return "this expression is invalid";
    }
    catch(UnsupportedOperationException e) {
      return "this expression contains an unsupported operation";
    }
  }

  boolean valid(char c) {
    return c=='1'||c=='2'||c=='3'||c=='4'||c=='5'||c=='6'||c=='7'||c=='8'||c=='9'||c=='0'||c=='+'||c=='-'||c=='*'||c=='/'||c=='!'||c=='%'||c=='('||c==')'||c=='^'||c=='.'||(96<c&&c<123);
  }

  void write() {
    //System.out.println(key);
    if (writing) {
      if (key==ENTER || key==RETURN) {
        create();
        textSize(30);
        fill(0, 0, 0);
        textAlign(LEFT);
        text(written, 110, 215);
        text(result(), 200, 300);
        writing=false;
        written="";
      } else {
        if (key==BACKSPACE && written.length()>0) {
          written=written.substring(0, written.length()-1);
        } else if (valid(key) && written.length()<16) {
          written+=key;
        }
        r(100, 180, 400, 50, 5, color(185, 191, 235));
        textSize(30);
        fill(0, 0, 0);
        textAlign(LEFT);
        text(written, 110, 215);
        //System.out.println("w "+written);
        //System.out.println("l "+written.substring(written.length()-1));
      }
      //System.out.println(key=='?');
      //System.out.println(keyPressed);
      if (written.length()>0 && written.substring(written.length()-1).equals("?")) {
        //System.out.println("now");
        written=written.substring(0, written.length()-1);
      }
    }
  }


  double evaluate(String s) {
    s=s.replace("--", "+");
    s=s.replace("e", ""+Math.E);
    s=s.replace("pi", ""+Math.PI);
    boolean radian=true;
    while (s.contains("arcsin")) {
      s=evalF(s, "arcsin", radian);
    }
    while (s.contains("arccos")) {
      s=evalF(s, "arccos", radian);
    }
    while (s.contains("arctan")) {
      s=evalF(s, "acrtan", radian);
    }
    while (s.contains("sin")) {
      s=evalF(s, "sin", radian);
    }
    while (s.contains("cos")) {
      s=evalF(s, "cos", radian);
    }
    while (s.contains("tan")) {
      s=evalF(s, "tan", radian);
    }
    while (s.contains("log")) {
      s=evalF(s, "log", radian);
    }
    while (s.contains("ln")) {
      s=evalF(s, "ln", radian);
    }
    while (s.contains("abs")) {
      s=evalF(s, "abs", radian);
    }


    Stack<Integer> st=new Stack<Integer>();
    ArrayList<Integer> where=new ArrayList<Integer>();
    for (int i=0; i<s.length(); i++) {
      if (s.charAt(i)=='(') {
        st.push(i);
      }
      if (s.charAt(i)==')') {
        if (st.empty()) {
          throw new IllegalArgumentException();
        }
        where.add(st.pop());
        where.add(i);
      }
    }
    if (!st.empty()) {
      throw new IllegalArgumentException();
    }
    /*
    for (int o = 0; o < where.size(); o++) {
     println(where.get(o));
     }
     */
    //all ()s r legit

    for (int i=0; i<where.size(); i+=2) {
      String t=""+evaluate(s.substring(where.get(i)+1, where.get(i+1)));
      s=s.substring(0, where.get(i))+t+s.substring(where.get(i+1)+1);
      for (int j=i+2; j<where.size(); j++) {
        if (where.get(j)>where.get(i+1)) {
          where.set(j, where.get(j)-where.get(i+1)+where.get(i)+t.length()-1);
        }
      }
    }
    //no mo ()S
    ArrayList<String> parts=new ArrayList<String>();
    for (int i=0; i<s.length(); i++) {
      if (s.charAt(i)=='!'||s.charAt(i)=='%'||s.charAt(i)=='^'||s.charAt(i)=='*'||s.charAt(i)=='/'||s.charAt(i)=='+'||s.charAt(i)=='-') {
        String ss=s.substring(0, i);
        if (!ss.equals("")) {
          parts.add(ss);
        }
        parts.add(s.substring(i, i+1));
        s=s.substring(i+1);
        i=-1;
      }
    }
    parts.add(s);
    if (parts.get(0).equals("")) {
      parts.remove(0);
    }
    if (parts.get(parts.size()-1).equals("")) {
      parts.remove(parts.size()-1);
    }
    //broken up
    for (int i=0; i<parts.size()-1; i++) {
      if (parts.get(i).equals("-")&&parts.get(i+1).equals("-")) {
        parts.set(i, "+");
        parts.remove(i+1);
        i--;
      }
    }
    System.out.println(parts);
    try {
      int i;
      i=parts.indexOf("!");
      while (i!=-1) {
        int x=1;
        if (parts.get(i-1).length()>2&&parts.get(i-1).substring(parts.get(i-1).length()-2).equals(".0")) {
          parts.set(i-1, parts.get(i-1).substring(0, parts.get(i-1).length()-2));
        }
        int n=Integer.parseInt(parts.get(i-1));
        for (int j=n; j>1; j--) {
          x*=j;
        }
        parts.set(i, ""+x);
        parts.remove(i-1);
        i=parts.indexOf("!");
      }
      i=parts.indexOf("%");
      while (i!=-1) {
        if (parts.get(i-1).length()>2&&parts.get(i-1).substring(parts.get(i-1).length()-2).equals(".0")) {
          parts.set(i-1, parts.get(i-1).substring(0, parts.get(i-1).length()-2));
        }
        if (parts.get(i+1).length()>2&&parts.get(i+1).substring(parts.get(i+1).length()-2).equals(".0")) {
          parts.set(i+1, parts.get(i+1).substring(0, parts.get(i+1).length()-2));
        }
        int x=Integer.parseInt(parts.get(i-1))%Integer.parseInt(parts.get(i+1));
        parts.set(i, ""+x);
        parts.remove(i+1);
        parts.remove(i-1);
        i=parts.indexOf("%");
      }
      i=parts.indexOf("^");
      while (i!=-1) {
        double x;
        if (i-2>=0&&parts.get(i-2).equals("-")) {
          x=Math.pow(Double.parseDouble(parts.get(i-1))*(-1), Double.parseDouble(parts.get(i+1)));
          parts.set(i, ""+x);
          parts.remove(i+1);
          parts.remove(i-2);
          parts.remove(i-2);
        } else {
          x=Math.pow(Double.parseDouble(parts.get(i-1)), Double.parseDouble(parts.get(i+1)));
          parts.set(i, ""+x);
          parts.remove(i+1);
          parts.remove(i-1);
        }
        i=parts.indexOf("^");
      }
      i=parts.indexOf("/");
      while (i!=-1) {
        double x=1.0/Double.parseDouble(parts.get(i+1));
        parts.set(i, "*");
        parts.set(i+1, ""+x);
        i=parts.indexOf("/");
      }
      i=parts.indexOf("*");
      while (i!=-1) {
        double x=Double.parseDouble(parts.get(i-1))*Double.parseDouble(parts.get(i+1));
        parts.set(i, ""+x);
        parts.remove(i+1);
        parts.remove(i-1);
        i=parts.indexOf("*");
      }
      i=parts.indexOf("-");
      while (i!=-1) {
        parts.set(i, "+");
        parts.set(i+1, "-"+parts.get(i+1));
        if (parts.get(0).equals("+")) {
          parts.remove(0);
        }
        i=parts.indexOf("-");
      }
      i=parts.indexOf("+");
      while (i!=-1) {
        double x=Double.parseDouble(parts.get(i-1))+Double.parseDouble(parts.get(i+1));
        parts.set(i, ""+x);
        parts.remove(i+1);
        parts.remove(i-1);
        i=parts.indexOf("+");
      }
    } 
    catch(Exception e) {
      throw new IllegalArgumentException();
    }
    if (parts.size()==1) {
      return Double.parseDouble(parts.get(0));
    }
    if (parts.size()==2&&parts.get(0)=="-") {
      return -1*Double.parseDouble(parts.get(1));
    }
    throw new UnsupportedOperationException();
  }

  String evalF(String s, String f, boolean r) {
    int i=s.indexOf(f+"(");
    int c=1;
    int j=i+f.length();
    if (i!=-1) {
      while (c!=0) {
        j++;
        if (s.charAt(j)=='(') {
          c++;
        }
        if (s.charAt(j)==')') {
          c--;
        }
      }
      double x=evaluate(s.substring(i+f.length()+1, j));
      if (f.equals("sin")) {
        if (!r) {
          x=Math.toRadians(x);
        }
        if (Math.sin(x)<.0000000001) {
          s=s.substring(0, i)+"0"+s.substring(j+1);
        } else {
          s=s.substring(0, i)+Math.sin(x)+s.substring(j+1);
        }
        System.out.println("x "+s);
      }
      if (f.equals("cos")) {
        if (!r) {
          x=Math.toRadians(x);
        }
        if (Math.cos(x)<.0000000001) {
          s=s.substring(0, i)+"0"+s.substring(j+1);
        } else {
          s=s.substring(0, i)+Math.cos(x)+s.substring(j+1);
        }
      }
      if (f.equals("tan")) {
        if (!r) {
          x=Math.toRadians(x);
        }
        if (Math.tan(x)<.0000000001) {
          s=s.substring(0, i)+"0"+s.substring(j+1);
        } else {
          s=s.substring(0, i)+Math.tan(x)+s.substring(j+1);
        }
      }
      if (f.equals("arcsin")) {
        s=s.substring(0, i)+Math.asin(x)+s.substring(j+1);
      }
      if (f.equals("arccos")) {
        s=s.substring(0, i)+Math.acos(x)+s.substring(j+1);
      }
      if (f.equals("arctan")) {
        s=s.substring(0, i)+Math.atan(x)+s.substring(j+1);
      }
      if (f.equals("log")) {
        s=s.substring(0, i)+Math.log10(x)+s.substring(j+1);
      }
      if (f.equals("ln")) {
        s=s.substring(0, i)+Math.log(x)+s.substring(j+1);
      }
      if (f.equals("abs")) {
        s=s.substring(0, i)+Math.abs(x)+s.substring(j+1);
      }
    }
    System.out.println("b "+s+f);
    return s;
  }
}