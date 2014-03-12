
/* built with Studio Sketchpad: 
 *   http://sketchpad.cc
 * 
 * observe the evolution of this sketch: 
 *   http://studio.sketchpad.cc/sp/pad/view/ro.lf7y1AbsLhm/rev.4
 * 
 * authors: 
 *   Pete Welter

 * license (unless otherwise specified): 
 *   creative commons attribution-share alike 3.0 license.
 *   http://creativecommons.org/licenses/by-sa/3.0/ 
 */ 
// constants - these are unchanged
int KEY_UP = 1;
int KEY_DOWN = 2;
int KEY_RIGHT = 3;
int KEY_LEFT = 4;

int collCount = 0;

// create global variables here
// create and load the new Sprite
Sprite s = new Sprite("alien.png");
Sprite ship = new Sprite("ship.png");
Sprite shot = null;


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
    
    s.setMoveDirection(4,3);
    s.setBounds(300,300);
    s.setBounce(true);
    
    ship.setBounds(300,300);
} 

void draw() {  // this is run repeatedly.  

    // erase the background to black
    background(0);
    
    // draw the sprite
   s.draw();
   ship.draw();
   if (shot != null) {
     shot.draw();
     if (shot.collidedWith(s)) {
       collCount += 1;
       println("Collision #" + collCount);
     }
     if (! shot.inBounds()) {
       shot = null;
     }
   }
}


// keyPressed is a Processing function called if a key is pressed
void keyPressed() { // this is called if a key is pressed
    if (key == CODED) {
        if (keyCode == UP) {
            ship.moveWithKey(KEY_UP);
        }
        else if (keyCode == DOWN) {
            ship.moveWithKey(KEY_DOWN);
        }
        else if (keyCode == RIGHT) {
            ship.moveWithKey(KEY_RIGHT);
        }
        else if (keyCode == LEFT) {
            ship.moveWithKey(KEY_LEFT);
        }  
    }
    else if (key == ' ') {
      if (shot == null) {
        shot = new Sprite("shot.png");
        shot.x = ship.right();
        shot.y = ship.y + int(ship.height() / 2);
        shot.setBounds(300,300);
        shot.setMoveDirection(8,0);
      }
    }
}
