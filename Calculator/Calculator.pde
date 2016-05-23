import java.util.*;
import java.lang.*;
import java.io.*;
//import controlP5.*;
//ControlP5 cp5;
//public class Calculator {

Basic b1=new Basic();
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
  noStroke();

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
    //setupB();
    /*
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
     */
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
    r(100, 180, 400, 50, 5, color(185, 191, 235));
    writing=true;
  }
}

void keyReleased() {
  if (state=='b') {
    b1.write();
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
    if (state == 'b') {
      setup();
    }  
    //}
  }
}
/*
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
 */



//}