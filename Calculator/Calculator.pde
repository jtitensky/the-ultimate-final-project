import java.util.*;
import java.lang.*;
import java.io.*;
import controlP5.*;
ControlP5 cp5;
//public class Calculator {

void r(float x, float y, float w, float h, float r, color c) {
  fill(c);
  rect(x, y, w, h, r);
}
void dt(String t, float x, float y, float w, float h, color c, float s, int al) {
  fill(c);
  textAlign(al);
  textSize(s);
  text(t, x, y, w, h);
}
///////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

PFont font;
String state = "";
String eval = "";
void setup() {
  font = loadFont("try1.vlw");
  textFont(font);
  noStroke();
  
  //if (state=="") {
    size(400, 400);
    background(250, 249, 237);

    //0.
    r(100, 40, 200, 50, 13, color(100));
    dt("Calculator", 113, 55, 170, 100, color(225), 30, CENTER);

    //1.
    r(250, 100, 100, 40, 13, color(100));
    dt("Basic", 250, 113, 100, 100, color(225), 22, CENTER);

    //2.
    r(250, 150, 100, 40, 10, color(100));
    dt("Calculus", 250, 163, 100, 100, color(225), 22, CENTER);

    //3.
    r(250, 200, 100, 40, 10, color(100));
    dt("Statistics", 250, 213, 100, 100, color(225), 22, CENTER);

    //4.
    r(250, 250, 100, 40, 10, color(100));
    dt("Graph", 250, 263, 100, 100, color(225), 22, CENTER);

    //5.
    r(250, 300, 100, 40, 10, color(100));
    dt("Matrices", 250, 313, 100, 100, color(225), 21, CENTER);
  //}  

  if (state == "b") {
    size(400, 400);
    background(0);
    r(50, 30, 100, 40, 10, color(100));
    dt("Back", 50, 40, 100, 100, color(225), 25, CENTER);
    cp5 = new ControlP5(this);
    cp5.addTextfield("Type an expression you would like to evaluated...")
      .setPosition(50, 100)
      .setSize(200, 40)
      .setFont(font)
      .setFocus(false)      
      .setColor(color(105, 204, 100))
      ;
  }
}

void draw() {
  if (state=="") {
    thingsHappening();
  }
  //user presses one of the options - check which and do stuff
}

void thingsHappening() {
  //if (state!="") { 
  if (mousePressed) {
    int x = mouseX; 
    int y = mouseY;
    if (x > 250 && x < 350) {
      if (y > 100 && y < 140) {  
        state = "b"; // "basic"
      }
      if (y > 150 && y < 190) {
        state = "c"; //calculus
      }
      if (y > 200 && y < 240) {
        state = "s";  //statistics
      }
      if (y > 250 && y < 290) {
        state = "g"; //graph
      }
      if (y > 290 && y < 340) {
        state = "m"; //matrices
      }
    }
    if (state == "b") {
      setup();
    }  
    //}
  }
}
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {
    eval =  theEvent.getStringValue();
    if (eval!="") {
      println(eval);
      println(evaluate(eval));
      r(50, 200, 200, 200, color(0), 10);
      dt(evaluate(eval)+"", 100, 230, 170, 100, color(225), 60, CENTER);
    }
  }
}


public static double evaluate(String s) {
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
//}