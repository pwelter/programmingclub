
// the Sprite consists of an image loaded from a URL and it's x,y position
class Sprite {
    int x;
    int y; 
    PImage img;
    String imageURL;
    
    boolean selfMoving = false;
    int deltaX;
    int deltaY;
    
    // the boundaries that the sprite cannot move beyond
    int leftBounds = 0;
    int rightBounds = 1000;
    int topBounds = 0;
    int bottomBounds = 1000;
    
    boolean bounce = false;
    
    
    Sprite(String url) {
        imageURL = url;
        img = requestImage(url);
    }
    
    void setBounce(boolean b) {
      bounce = b;
    }
    
    boolean isSelfMoving() {
      return selfMoving;
    }
    // sets the number of pixels that the sprite will move each time through the loop
    // in x (horizontal) and y(vertical) direction
    void setMoveDirection(int newX, int newY) {
        selfMoving = true;
        deltaX = newX;
        deltaY = newY;
    }
    
    // draws the sprite using the image
    void draw() {
        // if we move on our own, then do a move
        if (isSelfMoving()) {
          move();
        }
        
        // now draw, if have a image loaded
        if (img.width == 0) {
            println("image not loaded yet");
        } else if (img.width == -1) {
            println("error loading image: " + imageURL);
        }
        else {
            image(img,x,y);
        }
    }
    
    void setBounds(int left, int top, int right, int bottom) {
      leftBounds = left;
      topBounds = top;
      rightBounds = right;
      bottomBounds = bottom;
    }
    void setBounds(int right, int bottom) {
      rightBounds = right;
      bottomBounds = bottom;
    }
    
    void moveWithKey(int direction) {
        if (direction == KEY_UP) {
            y -= 5;
        }
        else if (direction == KEY_DOWN) {
            y += 5;
        }
        else if (direction == KEY_RIGHT) {
            x += 5;
        }
        else if (direction == KEY_LEFT) {
            x -= 5;
        }
    }
    
    // move using the automatic moving
    void move() {
        if (selfMoving) {
            x += deltaX;
            y += deltaY;
            if (! inBounds()) {
              if (bounce) {
                bounceBounds();
              }
            }
        }
    }

  // returns true if the Sprite is in bounds
    boolean inBounds() {
        if (x < leftBounds) {
          return false; 
        } else if ((x + img.width) > rightBounds) {
            return false;
        }
        if (y < topBounds) {
            return false;
        } else if ((y + img.height) > bottomBounds) {
            return false;
        }
        return true;
    }
    
    // change the direction to bounce off the edges of the bounds
    void bounceBounds() {
        if (x < leftBounds) {
            x = leftBounds;
            deltaX *= -1;
        } else if ((x + img.width) > rightBounds) {
            x = rightBounds - img.width;
            deltaX *= -1;
        }
        if (y < topBounds) {
            y = topBounds;
            deltaY *= -1;
        } else if ((y + img.height) > bottomBounds) {
            y = bottomBounds - img.height;
            deltaY *= -1;
        }
    }

    int width() {
      return img.width;
    }
    int height() {
      return img.height;
    }
    int right() {
      return x + img.width;
    }
    int bottom() {
      return y + img.height;
    }
    
    
    // return true if this sprite collided with the sprite passed in
    boolean collidedWith(Sprite s) {
      if (!((x + width()) >= s.x)) {         
        return false;     
      }     
      if (!(x <= (s.x + s.width()))) {         
        return false;     
      }     
      if (!((y - height()) <= s.y)) {         
        return false;     
      }     
      if (!(y >= (s.y - s.height()))) {         
        return false;     
      }     
      return true; 
    }    
}
        
    



