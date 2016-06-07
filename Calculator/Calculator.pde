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
Statistics s1=new Statistics();
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
  background(100, 87, 75);

  //0.
  r(20, 30, 250, 70, 13, color(234, 162, 102));
  dt("Calculator", 20, 45, 250, 100, color(225), 50, CENTER);


  //1.
  r(30, 150, 100, 40, 13, color(234, 162, 102));
  dt("Basic", 30, 163, 100, 100, color(225), 22, CENTER);
  dt("This feature allows the user to input any valid math expression and get a proper answer in return. This feature also includes finding definite integrals and a value of a function at a certain derivative at a certain point.", 145, 155, 450, 300, color(225), 18, LEFT );

  //2.
  r(30, 250, 100, 40, 10, color(234, 162, 102));
  dt("Statistics", 30, 263, 100, 100, color(225), 22, CENTER);
  dt("STATSSS", 145, 255, 450, 300, color(225), 18, LEFT );


  //3.
  r(30, 350, 100, 40, 10, color(234, 162, 102));
  dt("Graph", 30, 363, 100, 100, color(225), 22, CENTER);
  dt("This feature allows the user to graph valid x-y, polar, and parametric relations. The axis and the x/ø/t steps can be adjusted by user.", 145, 355, 450, 300, color(225), 18, LEFT );


  //4.
  r(30, 450, 100, 40, 10, color(234, 162, 102));
  dt("Matrices", 30, 463, 100, 100, color(225), 22, CENTER);  
  dt("This feature gives the user to input two matrices and do basic computations with them. The matrices can be added and multiplied. The transpose and discriminants of both matrices can also be found.", 145, 455, 450, 300, color(225), 18, LEFT );


  if (state == 'b') {
    b1.create();
  }
  if (state == 'g') {
    g1.create();
  }
  if (state=='m') {
    m1.create();
  }
  if (state=='s') {
    s1.create();
  }
}

void draw() {
  if (state==' ') {
    thingsHappening();
  }
  //user presses one of the options - check which and do stuff
}

void mouseClicked() {
  if (state=='b') {
    b1.create();
    b1.mClick();
    writing = true;
  }
  if (state == 'g') {
    g1.create();
    g1.mClick();
    writing = true;
  }
  if (state=='s') {
    s1.mClick();
  }
  if (state == 'm') {
    m1.create();
    m1.mClick();
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
  if (state=='s') {
    s1.write();
  }
  if (state == 'm') {
    m1.write();
  }
}


void thingsHappening() { 
  if (mousePressed) {
    int x = mouseX; 
    int y = mouseY;
    if (x > 30 && x < 130 && state == ' ') {
      if (y > 150 && y < 190) {  
        state = 'b'; // "basic"
      }
      if (y > 250 && y < 290) {
        state = 's'; //calculus
      }
      if (y > 350 && y < 390) {
        state = 'g';  //statistics
      }
      if (y > 450 && y < 490) {
        state = 'm'; //graph
      }
    }
  }
  setup();
}