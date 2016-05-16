import java.util.*;
import java.lang.*;
import java.io.*;
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
void setup() {
  size(400, 400);
  background(250, 249, 237);
  font = loadFont("try1.vlw");
  textFont(font);
  noStroke();

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

  /*
  int x = mouseX; 
   int y = mouseY;
   
   if(mousePressed){
   if(x > 250 && x < 350){
   if(y > 100 && y < 140){
   r(100, 200,  40, 40, 10, color(100)); 
   }  
   }      
   }
   */
}

void draw() {
  //user presses one of the options - check which and do stuff
  if (mousePressed) {
    int x = mouseX; 
    int y = mouseY;
    if (x > 250 && x < 350) {
      if (y > 100 && y < 140) {
        r(10, 200, 20, 20, 10, color(50));
      }
      if (y > 150 && y < 190) {
        r(40, 200, 20, 20, 10, color(70));
      }
      if (y > 200 && y < 240) {
        r(70, 200, 20, 20, 10, color(90));
      }
      if (y > 250 && y < 290) {
        r(100, 200, 20, 20, 10, color(110));
      }
      if (y > 290 && y < 340) {
        r(130, 200, 20, 20, 10, color(130));
      }
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