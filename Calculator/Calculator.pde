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

void draw(){
  //user presses one of the options - check which and do stuff
  if(mousePressed){
   int x = mouseX; int y = mouseY;
   if(x > 250 && x < 350){
     if(y > 100 && y < 140){
       r(10, 200, 20, 20, 10, color(50)); 
     }
     if(y > 150 && y < 190){
       r(40, 200, 20, 20, 10, color(70)); 
     }
     if(y > 200 && y < 240){
       r(70, 200, 20, 20, 10, color(90)); 
     }
     if(y > 250 && y < 290){
       r(100, 200, 20, 20, 10, color(110)); 
     }
     if(y > 290 && y < 340){
       r(130, 200, 20, 20, 10, color(130)); 
     }
   }
  }
}
  