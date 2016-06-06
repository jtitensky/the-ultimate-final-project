class Basic {  
  Basic() {
  }
  String ans = ""; 
  String writtenE = "";
  int wToWriteX;
  int wToWriteY;
  int code = -1; 
  double uBound, dBound, val;
  String exp = "";
  String exp1 = "";
  int n;

  void create() {
    System.out.println(c1.integrate(0.0, 2.0, "x", 'x'));
    background(100, 87, 75);
    fill(48, 71, 242);
    PFont f = createFont("Comic Sans MS Bold", 48); //HATERS GONNA HATE, BUT COMIC SANS IS LOVE, COMIC SANS IS LIFE, //...
    textFont(f, 48);
    fill(222, 218, 215);
    ///////
    textSize(25);
    textAlign(RIGHT);
    text("Enter an expression:", 263, 35);
    textAlign(LEFT);
    text("Ans: "+ans, 350, 37);
    r(20, 52, 450, 40, 5, color(234, 162, 102));
    textAlign(LEFT);
    fill(0);
    text(writtenE, 30, 82);
    written="";
    ///////

    //////////////////
    fill(222, 218, 215);
    textSize(80);
    textAlign(RIGHT);
    text("∫", 45, 305);
    r(44, 240, 100, 20, 5, color(234, 162, 102));
    r(44, 300, 100, 20, 5, color(234, 162, 102));
    r(55, 265, 300, 30, 5, color(234, 162, 102));
    r(380, 300, 80, 20, 5, color(234, 162, 102));
    fill(222, 218, 215);
    textAlign(LEFT);
    textSize(16);
    text(uBound+"", 150, 256);
    text(dBound+"", 150, 316);
    textSize(13);
    fill(0);
    text("INTEGRATE", 385, 316);
    textSize(22);
    fill(222, 218, 215);
    text(exp, 366, 287);
    //////////////////

    //////////////////
    fill(222, 218, 215);
    textSize(30);
    textAlign(RIGHT);
    text("dx", 48, 475);
    text("dy", 48, 515);
    textSize(60);
    text("-", 48, 500);
    r(58, 470, 300, 30, 5, color(234, 162, 102));
    textSize(22);
    fill(222, 218, 215);
    text("@ x = ", 84, 556);
    text("@ the         derivative", 365, 556);
    r(84, 540, 40, 20, 5, color(234, 162, 102));
    r(210, 540, 40, 20, 5, color(234, 162, 102));
    r(380, 510, 80, 20, 5, color(234, 162, 102));
    fill(222, 218, 215);
    textAlign(LEFT);
    text(exp1, 373, 493);
    textSize(14);
    fill(0);
    text("DERIVATE", 385, 526);
    textSize(16);
    fill(222, 218, 215);
    text(val+"", 88, 580);
    text(n+"", 213, 580);
    //////////

    r(500, 550, 60, 20, 5, color(234, 162, 102));
    fill(0);
    textSize(15);
    text("BACK", 510, 566);
  }

  void mClick() {
    if (mouseX > 500 && mouseX < 560 && mouseY > 550 && mouseY < 570) {
      state = ' ';
    }
    if (20<mouseX && mouseX<470 && 52<mouseY && mouseY<97) {
      r(20, 52, 450, 40, 5, color(185, 191, 235));
      wToWriteX = 30;
      wToWriteY = 80;
      code = 0;
    }
    if (44<mouseX && mouseX<144 && 240<mouseY && mouseY<260) {
      code = 1; 
      writtenE = "";
      r(44, 240, 100, 20, 5, color(185, 191, 235));
      wToWriteX = 48;
      wToWriteY = 256;
    }
    if (44<mouseX && mouseX<144 && 300<mouseY && mouseY<320) {
      code = 2; 
      writtenE = "";
      r(44, 300, 100, 20, 5, color(185, 191, 235));
      wToWriteX = 48;
      wToWriteY = 316;
    }
    if (55<mouseX && mouseX<355 && 265<mouseY && mouseY<295) {
      code = 3;
      r(55, 265, 300, 30, 5, color(185, 191, 235));
      writtenE = "";
      wToWriteX = 55;
      wToWriteY = 286;
    }
    if (380<mouseX && mouseX<460 && 300<mouseY && mouseY<320) {
      ans = ""+c1.integrate(dBound, uBound, exp, 'x');
    }
    //r(380, 510, 80, 20, 5, color(234, 162, 102));
    if (380<mouseX && mouseX<460 && 510<mouseY && mouseY<530) {
      ans = ""+c1.differentiate('x', exp1, val, n);
    }
    if (58<mouseX && mouseX<358 && 470<mouseY && mouseY<500) {
      code = 4;
      r(58, 470, 300, 30, 5, color(185, 191, 235));
      writtenE = "";
      wToWriteX = 62;
      wToWriteY = 493;
    }
    if (84<mouseX && mouseX<124 && 540<mouseY && mouseY<560) {
      code = 5;
      r(84, 540, 40, 20, 5, color(185, 191, 235));
      writtenE = "";
      wToWriteX = 88;
      wToWriteY = 556;
    }
    if (210<mouseX && mouseX<250 && 540<mouseY && mouseY<560) {
      code = 6;
      r(210, 540, 40, 20, 5, color(185, 191, 235));
      writtenE = "";
      wToWriteX = 212;
      wToWriteY = 556;
    }
  }

  String result() {
    try {
      return ""+evaluate(written);
    }
    catch(IllegalArgumentException e) {
      return "INVALID ERR";
    }
    catch(UnsupportedOperationException e) {
      return "UNSUPPORTED OP ERR";
    }
  }

  boolean valid(char c) {
    return c=='1'||c=='2'||c=='3'||c=='4'||c=='5'||c=='6'||c=='7'||c=='8'||c=='9'||c=='0'||c=='+'||c=='-'||c=='*'||c=='/'||c=='!'||c=='%'||c=='('||c==')'||c=='^'||c=='.'||(96<c&&c<123);
  }

  void write() {
    String writtenn="";
    if (writing) {
      if (key==ENTER || key==RETURN) {
        if (code == 0) {
          int lines=1+written.length()/27;
          r(20, 52, 450, 40*lines, 5, color(185, 191, 235));
          writtenE = written;
          ans = result();
        }
        if (code == 1) {
          uBound = evaluate(written);
        }
        if ( code == 2) {
          dBound = evaluate(written);
        }
        if (code == 3) {
          exp = written;
        }
        if (code == 4) {
          exp1 = written;
        }
        if (code == 5) {
          val = evaluate(written);
        }
        if (code == 6) {
          n = (int)(evaluate(written));
        }
        create();
      } else {
        if (key==BACKSPACE && written.length()>0) {
          written=written.substring(0, written.length()-1);
        } else if (valid(key) ) {//&& written.length()<16) {
          written+=key;
        }
        if (code==0) {
          int lines=1+written.length()/27;
          r(20, 52, 450, 40*lines, 5, color(185, 191, 235));
          textSize(25);
          fill(0);
          textAlign(LEFT);

          if (written.length()>27) {
            for (int i=0; i<written.length(); i++) {
              if (i>0&&i%27==0) {
                //System.out.println("2   "+i);
                writtenn+="\n";
              }
              writtenn+=written.charAt(i);
            }
            text(writtenn, wToWriteX, wToWriteY);
            writtenn="";
          } else {
            text(written, wToWriteX, wToWriteY);
          }
          text(writtenn, wToWriteX, wToWriteY);
          writtenn="";
        }
        if (code == 1) {
          r(44, 240, 100, 20, 5, color(185, 191, 235));
          textAlign(LEFT);
          textSize(16);
          fill(0);
          text(written, wToWriteX, wToWriteY);
        }
        if (code == 2) {
          r(44, 300, 100, 20, 5, color(185, 191, 235));
          textAlign(LEFT);
          textSize(16);
          fill(0);
          text(written, wToWriteX, wToWriteY);
        }
        if (code == 3) {
          r(55, 265, 300, 30, 5, color(185, 191, 235));
          textAlign(LEFT);
          textSize(22);
          fill(0);
          text(written, wToWriteX+3, wToWriteY+2);
        }
        if (code == 4) {
          r(58, 470, 300, 30, 5, color(185, 191, 235));
          textAlign(LEFT);
          fill(0);
          textSize(22);
          text(written, wToWriteX, wToWriteY);
        }
        if (code == 5) {
          r(84, 540, 40, 20, 5, color(185, 191, 235));
          textAlign(LEFT);
          fill(0);
          textSize(15);
          text(written, wToWriteX, wToWriteY);
        }
        if (code == 6) {
          textAlign(LEFT);
          r(210, 540, 40, 20, 5, color(185, 191, 235));
          fill(0);
          textSize(15);
          text(written, wToWriteX, wToWriteY);
        }
      }
    }
  }


  double evaluate(String s) {
    //////System.out.println(s);
    s=s.replace("e", ""+Math.E);
    s=s.replace("pi", ""+Math.PI);
    s=s.replace("--", "+");
    s=s.replace("+-", "-");
    s=s.replace("ans", ans);
    s=s.replace("ANS", ans);
    s=s.replace("Ans", ans);
    //////System.out.println(s);
    s=s.replace("*-", "*-1*");
    s=s.replace("/-", "*-1/");
    //////System.out.println(s);
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
      //////System.out.println("SS "+s);
      s=evalF(s, "sin", radian);
      //////System.out.println("SSS "+s);
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
      //String t=""+evaluate(s.substring(where.get(i)+1, where.get(i+1)));
      DecimalFormat df=new DecimalFormat("#");
      df.setMaximumFractionDigits(10);
      String t=""+df.format(evaluate(s.substring(where.get(i)+1, where.get(i+1))));
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
    //System.out.println("1 "+parts);
    for (int i=0; i<parts.size()-1; i++) {
      if (parts.get(i).equals("-")&&parts.get(i+1).equals("-")) {
        //parts.set(i, "+");
        //parts.remove(i+1);
        parts.set(i+2, "-"+parts.get(i+2));
        parts.remove(i+1);
        //System.out.println("          "+parts);
        i--;
      }
      if (parts.get(i).equals("+")&&parts.get(i+1).equals("-")) {
        parts.remove(i);
        i--;
      }      
      if (parts.get(i).equals("*")&&parts.get(i+1).equals("-")) {
        parts.remove(i+1);
        parts.set(i+1, "-"+parts.get(i+1));
        i--;
      }  
      if (parts.get(i).equals("/")&&parts.get(i+1).equals("-")) {
        parts.remove(i);
        i--;
      }  
      /*
      if (parts.get(i).equals("-")&&47<parts.get(i+1).charAt(0)&&parts.get(i+1).charAt(0)<58) {
       
       if (i>0&&47<parts.get(i-1).charAt(0)&&parts.get(i-1).charAt(0)<58) {
       parts.set(i, "+");
       } else {
       parts.remove(i);
       }
       i--;
       }
       */
    }
    //System.out.println(parts);
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
        boolean blah=true;
        if (i-3>=0&&47<parts.get(i-3).charAt(0)&&parts.get(i-3).charAt(0)<58) {
          blah=false;
        }
        if (i-2>=0&&parts.get(i-2).equals("-")&&blah) {
          x=Math.pow(Double.parseDouble(parts.get(i-1))*(-1), Double.parseDouble(parts.get(i+1)));
          parts.set(i, ""+x);
          parts.remove(i+1);
          parts.remove(i-2);
          parts.remove(i-2);
          //System.out.println("^ "+parts);
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
        if (parts.get(i+1).charAt(1)=='-') {
          parts.set(i+1, parts.get(i+1).substring(2));
        }
        //System.out.println("-- "+parts);
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
      if (parts.get(0).equals("-0.0")) {
        return 0.0;
      }
      return Double.parseDouble(parts.get(0));
    }
    if (parts.size()==2&&parts.get(0)=="-"&&parts.get(1)!="0.0") {
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
      DecimalFormat df=new DecimalFormat("#");
      df.setMaximumFractionDigits(10);
      if (f.equals("sin")) {
        if (!r) {
          x=Math.toRadians(x);
        }
        if (Math.sin(x)<.0000000001&&Math.sin(x)>-.0000000001) {
          s=s.substring(0, i)+"0"+s.substring(j+1);
        } else {
          s=s.substring(0, i)+df.format(Math.sin(x))+s.substring(j+1);
        }
      }
      if (f.equals("cos")) {
        if (!r) {
          x=Math.toRadians(x);
        }
        if (Math.cos(x)<.0000000001&&Math.cos(x)>-.0000000001) {
          s=s.substring(0, i)+"0"+s.substring(j+1);
        } else {
          s=s.substring(0, i)+df.format(Math.cos(x))+s.substring(j+1);
        }
      }
      if (f.equals("tan")) {
        if (!r) {
          x=Math.toRadians(x);
        }
        if (Math.tan(x)<.0000000001&&Math.tan(x)>-.0000000001) {
          s=s.substring(0, i)+"0"+s.substring(j+1);
        } else {
          s=s.substring(0, i)+df.format(Math.tan(x))+s.substring(j+1);
        }
      }
      if (f.equals("arcsin")) {
        s=s.substring(0, i)+df.format(Math.asin(x))+s.substring(j+1);
      }
      if (f.equals("arccos")) {
        s=s.substring(0, i)+df.format(Math.acos(x))+s.substring(j+1);
      }
      if (f.equals("arctan")) {
        s=s.substring(0, i)+df.format(Math.atan(x))+s.substring(j+1);
      }
      if (f.equals("log")) {
        s=s.substring(0, i)+df.format(Math.log10(x))+s.substring(j+1);
      }
      if (f.equals("ln")) {
        s=s.substring(0, i)+df.format(Math.log(x))+s.substring(j+1);
      }
      if (f.equals("abs")) {
        s=s.substring(0, i)+df.format(Math.abs(x))+s.substring(j+1);
      }
    }
    return s;
  }
}