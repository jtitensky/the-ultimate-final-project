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
    String s;
    try {
      s=""+evaluate(written);
      return s;
    }
    catch(IllegalArgumentException e) {
      return "this expression is invalid";
    }
    catch(UnsupportedOperationException e) {
      return "this expression contains an unsupported operation";
    }
  }


  void write() {
    System.out.println(key);
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
        } else {
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
        System.out.println("now");
        written=written.substring(0, written.length()-1);
      }
    }
  }


  double evaluate(String s) {
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
        double x=Math.pow(Double.parseDouble(parts.get(i-1)), Double.parseDouble(parts.get(i+1)));
        parts.set(i, ""+x);
        parts.remove(i+1);
        parts.remove(i-1);
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
}