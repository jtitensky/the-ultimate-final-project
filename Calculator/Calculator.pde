import java.util.*;
import java.lang.*;
import java.io.*;
import java.text.*;
//import controlP5.*;
//ControlP5 cp5;
//public class Calculator {

Basic b1= new Basic();
Calculus c1=new Calculus();
Graph g1 = new Graph();
Matricies m1=new Matricies();
boolean writing=false;
String written="";

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
Character state = ' ';
String eval = "";
void setup() {
  font = loadFont("try1.vlw");
  textFont(font);
  //noStroke();

  point(100, 200);

  //if (state=="") {
  size(600, 600);
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

  if (state == 'b') {
    b1.create();
  }
  if (state == 'g') {
    g1.create();
  }
  if (state=='c') {
    c1.create();
  }
  if (state=='m') {
    m1.create();
  }
}

void draw() {
  if (state==' ') {
    thingsHappening();
  }
  //user presses one of the options - check which and do stuff
}

void mouseClicked() {
  if (state=='b' && b1.mouseOnBox()) {
    b1.create();
    //r(100, 180, 400, 50, 5, color(185, 191, 235));
    r(75, 125, 450, 50, 5, color(185, 191, 235));
    writing = true;
  }
  if (state == 'g') {
    g1.create();
    g1.mClick();
    writing = true;
  }
}

void keyReleased() {
  if (state=='b') {
    b1.write();
  }
  if (state=='g') {
    g1.write();
  }
}


void thingsHappening() {
  //if (state!="") { 
  if (mousePressed) {
    int x = mouseX; 
    int y = mouseY;
    if (x > 250 && x < 350) {
      if (y > 100 && y < 140) {  
        state = 'b'; // "basic"
      }
      if (y > 150 && y < 190) {
        state = 'c'; //calculus
      }
      if (y > 200 && y < 240) {
        state = 's';  //statistics
      }
      if (y > 250 && y < 290) {
        state = 'g'; //graph
      }
      if (y > 290 && y < 340) {
        state = 'm'; //matrices
      }
    }
    if (state == 'b' || state == 'c' || state == 's' || state == 'g' || state == 'm') {
      setup();
    }
    //}
  }
}