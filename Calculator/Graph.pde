class Graph {
  Graph() {
    for (int i = 0; i < written.length; i++) {
      written[i] = "";
    }
  }

  void clearS() {
    written = new String[17];  
    for (int i = 0; i < written.length; i++) {
      written[i] = "";
    }
  }

  Basic b2 = new Basic();
  double minX = -2.0;
  double maxX = 2.0;
  double xStep = 0.25;
  double minY = -2.0; 
  double maxY = 2.0;
  double oMin = -10.0;
  double oMax = 10.0;
  double oStep = 0.1;
  String[] written = new String[17];
  char mode = 'r';
  int wToWriteX, wToWriteY, cWritten;

  void create() {
    background(55, 219, 189);
    fill(48, 71, 242);
    PFont f = createFont("Comic Sans MS Bold", 48); //HATERS GONNA HATE, BUT COMIC SANS IS LOVE, COMIC SANS IS LIFE, //...
    textFont(f, 48);
    textSize(22);
    textAlign(CENTER);
    r(500, 50, 50, 50, 10, color(0));

    r(400, 20, 80, 30, 5, color(91, 108, 235));
    r(400, 60, 80, 30, 5, color(91, 108, 235));
    r(400, 100, 80, 30, 5, color(91, 108, 235));
    fill(237, 159, 12);
    text("REC", 440, 44);
    text("POL", 440, 84);
    text("PARA", 440, 124);

    if (mode == 'r') {
      fill(250, 8, 8);
      for (int j = 203, i = 0; j < 570 && i < 10; j+=40, i++) {
        text("y"+i+":", 20, j);
      }
      text("x-min:", 53, 43);
      text("x-max:", 53, 83);
      text("y-min:", 53, 123);
      text("y-max:", 53, 163);
      text("x-Step:", 244, 47);
      r(289, 23, 50, 30, 5, color(91, 108, 235));

      fill(48, 71, 242);
      for (int j = 180; j < 550; j+=40) {
        r(40, j, 300, 30, 5, color(91, 108, 235));
      }
      for (int j = 20; j < 150; j+=40) {
        r(100, j, 50, 30, 5, color(91, 108, 235));
      }
      for (int i = 180, j = 0; i < 550 && j < 10; i+=40, j++) {
        System.out.println(written[j]);
        textSize(25);
        textAlign(LEFT);
        text(written[j], 350, i+22);
      }
      for (int i = 20, j = 10; i < 150 && j < 14; i+=40, j++) {
        textSize(20);
        text(written[j], 158, i+22);
      }
      text(written[14], 350, 44);
    }

    if (mode == 'c') {
      fill(250, 8, 8);
      for (int j = 203, i = 0; j < 570 && i < 10; j+=40, i++) {
        text("r"+i+":", 20, j);
      }
      text("x-min:", 53, 43);
      text("x-max:", 53, 83);
      text("y-min:", 53, 123);
      text("y-max:", 53, 163);
      text("ø-min:", 244, 47);
      text("ø-max:", 244, 87);
      text("ø-Step:", 244, 127);
      r(289, 23, 50, 30, 5, color(91, 108, 235));
      r(289, 63, 50, 30, 5, color(91, 108, 235));
      r(289, 103, 50, 30, 5, color(91, 108, 235));

      fill(48, 71, 242);
      for (int j = 180; j < 550; j+=40) {
        r(40, j, 300, 30, 5, color(91, 108, 235));
      }
      for (int j = 20; j < 150; j+=40) {
        r(100, j, 50, 30, 5, color(91, 108, 235));
      }
      for (int i = 180, j = 0; i < 550 && j < 10; i+=40, j++) {
        //System.out.println(written[j]);
        textSize(25);
        textAlign(LEFT);
        text(written[j], 350, i+22);
      }
      for (int i = 20, j = 10; i < 150 && j < 14; i+=40, j++) {
        textSize(20);
        text(written[j], 158, i+22);
      }
      for (int i = 44, j = 14; j < 17; i+=40, j++) {
        textSize(20);
        text(written[j], 350, i);
      }
    }
    if (mode == 'p') {
      fill(250, 8, 8);
      for (int j = 203, i = 0; j < 570 || i < 5; j+=80, i++) {
        text("x"+i+":", 20, j);
        text("y"+i+":", 20, j+40);
      }
      text("x-min:", 53, 43);
      text("x-max:", 53, 83);
      text("y-min:", 53, 123);
      text("y-max:", 53, 163);
      text("t-min:", 244, 47);
      text("t-max:", 244, 87);
      text("t-Step:", 244, 127);
      r(289, 23, 50, 30, 5, color(91, 108, 235));
      r(289, 63, 50, 30, 5, color(91, 108, 235));
      r(289, 103, 50, 30, 5, color(91, 108, 235));

      fill(48, 71, 242);
      for (int j = 180; j < 550; j+=40) {
        r(40, j, 300, 30, 5, color(91, 108, 235));
      }
      for (int j = 20; j < 150; j+=40) {
        r(100, j, 50, 30, 5, color(91, 108, 235));
      }
      for (int i = 180, j = 0; i < 550 && j < 10; i+=40, j++) {
        //System.out.println(written[j]);
        textSize(25);
        textAlign(LEFT);
        text(written[j], 350, i+22);
      }
      for (int i = 20, j = 10; i < 150 && j < 14; i+=40, j++) {
        textSize(20);
        text(written[j], 158, i+22);
      }
      for (int i = 44, j = 14; j < 17; i+=40, j++) {
        textSize(20);
        text(written[j], 350, i);
      }
    }
  }

  void mClick() {  
    System.out.println(evalFunc("2x", "-2.0")); 

    if (mouseX>500&&mouseX<550&&mouseY>50&&mouseY<100) {
      //mode = 'g';
      graphh();
    }
    if (mouseX>400&&mouseX<480&&mouseY>20&&mouseY<50) {
      mode = 'r';
      clearS();
      create();
    }
    if (mouseX>400&&mouseX<480&&mouseY>60&&mouseY<90) {
      mode = 'c';
      clearS();
      create();
    }
    if (mouseX>400&&mouseX<480&&mouseY>100&&mouseY<130) {
      mode = 'p';
      clearS();
      create();
    }
    //if (!(mode=='g')) {
    if (mouseX > 40 && mouseX < 340 && mouseY > 170) {
      for (int x = 180; x < 570; x+=40) {
        if (mouseY > x && mouseY < x+40) {
          create();
          r(40, x, 300, 30, 5, color(185, 191, 235));
          cWritten = (int)((x-180)/40);
          //System.out.println(cWritten);
          wToWriteX = 50;
          wToWriteY = x+25;
          written[cWritten] = "";
          x = 600;
        }
      }
    } else {
      if (mouseX > 100 && mouseX < 150) {
        for (int x = 20; x < 150; x+=40) {
          if (mouseY > x && mouseY < x+40) {
            create();
            r(100, x, 50, 30, 5, color(185, 191, 235));
            cWritten = (int)((x-20)/40) + 10;
            //System.out.println(cWritten);
            wToWriteX = 105;
            wToWriteY = x+23;
            written[cWritten] = "";
            x = 6000;
          }
        }
      }
    }
    // }
    if (mode == 'r' && mouseX > 289 && mouseX < 339 && mouseY > 23 && mouseY < 53) {
      r(289, 23, 50, 30, 5, color(185, 191, 235));
      cWritten = 14;
      wToWriteX = 294;
      wToWriteY = 46;
      written[cWritten] = "";
    }
    if ( mode == 'c' || mode == 'p' && mouseX > 289 && mouseX < 339 && mouseY < 135) {
      for (int i = 23; i < 110; i+= 40) {
        if (mouseY > i && mouseY < i+30) {
          r(289, i, 50, 30, 5, color(185, 191, 235));
          cWritten = 14+(int)((i-23)/40); 
          wToWriteX = 294;
          wToWriteY = i+22;
          written[cWritten] = "";
        }
      }
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
        //text(written[cWritten], wToWriteX, wToWriteY);
        writing=false;
        //written[cWritten]="";
      } else {
        if (key==BACKSPACE && written[cWritten].length()>0) {
          written[cWritten]=written[cWritten].substring(0, written[cWritten].length()-1);
          if (cWritten<10) {
            r(40, 180+40*cWritten, 300, 30, 5, color(185, 191, 235));
          } else {
            if (cWritten < 14) {
              r(100, 20 +40*(Math.abs(10-cWritten)), 50, 30, 5, color(185, 191, 235));
            } else {
              r(289, 23+40*(Math.abs(14-cWritten)), 50, 30, 5, color(185, 191, 235));
            }
          }
        } else {
          if (cWritten < 10 && written[cWritten].length()<16 && b2.valid(key)) {
            written[cWritten]+=key;
          }
          if (cWritten >= 10 && written[cWritten].length() < 3 && b2.valid(key)) {
            written[cWritten]+=key;
          }
        }
        textSize(22);
        fill(0, 0, 0);
        textAlign(LEFT);
        text(written[cWritten], wToWriteX, wToWriteY);
        //System.out.println("w "+written);
        //System.out.println("l "+written.substring(written.length()-1));
      }
      //System.out.println(key=='?');
      //System.out.println(keyPressed);
      if (written[cWritten].length()>0 && written[cWritten].substring(written[cWritten].length()-1).equals("?")) {
        //System.out.println("now");
        written[cWritten]=written[cWritten].substring(0, written[cWritten].length()-1);
      }
    }
  }


  void graphh() {
    DecimalFormat df=new DecimalFormat("#");
    df.setMaximumFractionDigits(10);
    if (!written[10].equals("")) {
      minX = b2.evaluate(written[10]);
    }
    if (!written[11].equals("")) {
      maxX = b2.evaluate(written[11]);
    }
    if (!written[12].equals("")) {
      minY = b2. evaluate(written[12]);
    }
    if (!written[13].equals("")) {
      maxY = b2.evaluate(written[13]);
    }
    if (!written[14].equals("") && mode=='r') {
      xStep = b2.evaluate(written[14]);
    }
    if (mode == 'c' || mode == 'p') {
      if (!written[14].equals("")) {
        oMin = b2.evaluate(written[14]);
      }
      if (!written[15].equals("")) {
        oMax = b2.evaluate(written[15]);
      }
      if (!written[16].equals("")) {
        oStep = b2.evaluate(written[16]);
      }
    }
    background(55, 219, 189);
    double sy = 600/(maxY-minY);
    double sx = 600/(maxX-minX);
    double yax = Math.abs((minX*sx));
    double xax = Math.abs((maxY*sy));
    System.out.println("| sx:" + sx + ", sy:" + sy + ", yax:" + yax + ", xax:" + xax);
    //System.out.println(sy+" "+sx);
    System.out.println(mode);
    if (mode == 'r') {
      for (int i = 0; i < written.length; i++) {
        if (!written[i].equals("")) {
          //System.out.println(written[i]);
          fill(20*i);
          double minn = minX;
          while (minn < maxX) { 
            //try {
            // fill(100, 200, 150);
            //System.out.println(minn);
            double x1, x2, y1, y2;
            x1 = yax + minn*sx;
            x2 = yax + (minn+xStep)*sx;
            //System.out.println(df.format(minn));
            //System.out.println(evalFunc(written[i], df.format(minn))*sy);
            y1 = xax - evalFunc(written[i], df.format(minn))*sy;
            y2 = xax - evalFunc(written[i], df.format(minn+xStep))*sy; 
            //System.out.println(x1 + " " + y1);// + " " + x2 + " " + y2);
            //System.out.println("("+minn+", "+evalFunc(written[i], minn)+") -> (" minn+xStep + ", " +evalFunc(written[i], minn+xStep)+")");
            //System.out.println("(" + x1 + ", " + y1 + ") -> (" +x2 + ", "+y2+")");
            line((float)(x1), (float)(y1), (float)(x2), (float)(y2));
            //} 
            //catch (IllegalArgumentException e) {
            //}
            minn += xStep;
          }
        }
      }
    }
    if (mode == 'c') {
      for (int i = 0; i < written.length; i++) {
        if (!written[i].equals("")) {
          //System.out.println(written[i]);
          fill(20*i);
          double minn = oMin;
          while (minn < oMax) { 
            //try {
            // fill(100, 200, 150);
            //System.out.println(minn);
            double ans = evalFunc(written[i], df.format(minn));
            double ans1 = evalFunc(written[i], df.format(minn+oStep));
            //System.out.println(ans+" "+ans1);
            String exp = ""+df.format(ans)+"*"+"cos("+df.format(minn)+")";
            //System.out.println(exp);
            String eyp = ""+df.format(ans)+"*"+"sin("+df.format(minn)+")";
            String exp1 = ""+df.format(ans1)+"*"+"cos("+df.format((minn+oStep))+")";
            String eyp1 = ""+df.format(ans1)+"*"+"sin("+df.format((minn+oStep))+")";
            double xp = b2.evaluate(df.format(exp));
            double yp = b2.evaluate(df.format(eyp));
            double xp1 = b2.evaluate(df.format(exp1));
            double yp1 = b2.evaluate(df.format(eyp1));

            double x1, x2, y1, y2;
            x1 = yax + xp*sx;
            x2 = yax + xp1*sx;
            y1 = xax - yp*sy;
            y2 = xax - yp1*sy; 
            //System.out.println("("+minn+", "+evalFunc(written[i], minn)+") -> (" minn+xStep + ", " +evalFunc(written[i], minn+xStep)+")");
            //System.out.println("(" + x1 + ", " + y1 + ") -> (" +x2 + ", "+y2+")");
            line((float)(x1), (float)(y1), (float)(x2), (float)(y2)); 
            // catch (IllegalArgumentException e) {
            minn += oStep;
          }
        }
      }
    }
    if (mode == 'p') {
      for (int i = 0; i < written.length; i+=2) {
        if (!written[i].equals("")&&!written[i+1].equals("")) {
          //System.out.println(written[i]);
          fill(20*i);
          double minn = oMin;
          while (minn < oMax) { 
            //try {
            // fill(100, 200, 150);
            //System.out.println(minn);
            double xp = evalFunc(written[i], df.format(minn));
            double xp1 = evalFunc(written[i], df.format(minn+oStep));
            double yp = evalFunc(written[i+1], df.format(minn));
            double yp1 = evalFunc(written[i+1], df.format(minn+oStep));

            double x1, x2, y1, y2;
            x1 = yax + xp*sx;
            x2 = yax + xp1*sx;
            y1 = xax - yp*sy;
            y2 = xax - yp1*sy; 
            
            System.out.println(x1 + " " + y1);
            //System.out.println("(" + x1 + ", " + y1 + ") -> (" +x2 + ", "+y2+")");
            line((float)(x1), (float)(y1), (float)(x2), (float)(y2)); 
            // catch (IllegalArgumentException e) {
            minn += oStep;
          }
        }
      }
    }
    r(0, (float)(xax), 600, 0, 10, color(0));
    r((float)(yax), 0, 0, 600, 10, color(0));
  }

  boolean op(char f) {
    return f=='+' || f=='-'||f=='*'||f=='/'||f=='^';
  }

  double evalFunc(String s, String i) {
    DecimalFormat df=new DecimalFormat("#");
    df.setMaximumFractionDigits(10);
    String g = "";
    for (int j = 0; j < s.length(); j++) {
      if (s.charAt(j) == 'x') {
        if (j > 0 && Character.isDigit(s.charAt(j-1))) {
          g += "*(" + i+")";
        } else {
          g += "(" + i + ")";
        }
      } else {
        g += s.charAt(j);
      }
    }
    System.out.println(g);
    Basic b2 = new Basic();
    //System.out.println(""+s+","+i+","+b2.evaluate(g)+"");
    return b2.evaluate(g);
  }
}