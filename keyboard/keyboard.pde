// D move right, A moves left
// W moves up, X moves down

// test of Keyboard class 

// declare the keyboard object
Keyboard myKeys;

float x,y;
void setup() {
  size(640,360);  
  x = width/2;
  y = height/2;
  
  // create the keyboard object
  myKeys = new Keyboard();

}
 
void draw() {
  background(51);
  fill(255);
  ellipse(x,y,16,16);
 
 // how you detect if keys are down
  if (myKeys.isKeyDown("w") || myKeys.isKeyDown("up")) y--;
  if (myKeys.isKeyDown("x") || myKeys.isKeyDown("down")) y++;
  if (myKeys.isKeyDown("a") || myKeys.isKeyDown("left")) x--;
  if (myKeys.isKeyDown("d") || myKeys.isKeyDown("right")) x++;
}
 
 
 
 
 
// INCLUDE ALL THE CODE BELOW HERE IN YOUR PROGRAM

void keyPressed() {
  if (myKeys != null) {
    myKeys.keyPressedEvent(key,keyCode);
  }
}
 
void keyReleased() {
  if (myKeys != null) {
    myKeys.keyReleasedEvent(key,keyCode);
  }
}

class Keyboard {
  StringDict keyMap = new StringDict();
  
  void keyPressedEvent(char k, int code) {
    if (k == CODED) {
      keyMap.set(codedKeyToString(code),"true");
    } else {
      String s = "" + k;
      keyMap.set(s.toLowerCase(),"true");
    }
  }

  void keyReleasedEvent(char k, int code) {
    if (k == CODED) {
      keyMap.remove(codedKeyToString(code));
    } else {
      String s = "" + k;
      keyMap.remove(s.toLowerCase());
    }
  }
    
  boolean isKeyDown(String k) {
    return keyMap.hasKey(k.toLowerCase());
  } 
  
  String codedKeyToString(int k) {
    if (k == UP) {
      return "up";
    } else if (k == DOWN) {
      return "down";
    } else if (k == RIGHT) {
      return "right";
    } else if (k == LEFT) {
      return "left";
    }
    return "unknown_" + k;
  }
}
