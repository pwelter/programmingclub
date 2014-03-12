// create global variables here
// create and load the new Sprite
Button b = new Button("my test");


// setup is
void setup() {  // this is run once.   
    // set the background color
    background(0);
    
    // canvas size (Variable aren't evaluated. Integers only, please.)
    size(300, 300); 
      
    // smooth edges
    smooth();
    
    // limit the number of frames per second
    frameRate(30);
    b.setPosition(50,50);
    b.setFontSize(30);   
} 

void draw() {  // this is run repeatedly.  

    // erase the background to black
    background(0);
    b.draw();
}

void mousePressed() {
  if (b.clickedIn(mouseX,mouseY)) {
    b.toggle();
  }
}

