/* @pjs crisp=true; 
 */

int SIZE = 6;
int GRID_SIZE = 100;


Grid g = new Grid();

void setup() {
  size(600,600);
  frameRate(10);
  
  //3cell oscillators
  g.setC(5,5,1);
  g.setC(6,5,1);
  g.setC(7,5,1);
  
  // block
  g.setC(50,50,1);
  g.setC(50,51,1);
  g.setC(51,50,1);
  g.setC(51,51,1);

  // beacon
  g.setC(70,20,1);
  g.setC(70,21,1);
  g.setC(71,20,1);
  g.setC(71,21,1);
  g.setC(72,22,1);
  g.setC(72,23,1);
  g.setC(73,22,1);
  g.setC(73,23,1);
  
  //glider
  g.setC(80,80,1);
  g.setC(81,80,1);
  g.setC(82,80,1);
  g.setC(82,79,1);
  g.setC(81,78,1);
  

 // R-pentonimo
  g.setC(10,70,1);
  g.setC(11,69,1);
  g.setC(11,70,1);
  g.setC(11,71,1);
  g.setC(12,69,1);
}

void draw() { 
  background(0);
  for (int x = 0; x < GRID_SIZE; x++) {
   for (int y = 0; y < GRID_SIZE; y++) {
     g.drawC(x,y);
   }
  }
  g.update();  
} 

class Grid {
  int[][] a = new int[GRID_SIZE][GRID_SIZE];
  int[][] b = new int[GRID_SIZE][GRID_SIZE];
  
  boolean flipped = false;
  
  Grid () {  
    flipped = false;
  } 
  
  int countNeighbors(int x, int y) {
    int right = x + 1;
    if (right == GRID_SIZE) {
      right = 0;
    }
    int left = x - 1;
    if (left < 0) {
     left = GRID_SIZE - 1;
    }
    int above = y - 1;
    if (above < 0) {
      above = GRID_SIZE - 1;
    }
    int below = y + 1;
    if (below  == GRID_SIZE) {
      below = 0;
    }
    return getC(left,above) + getC(left, y) + getC(left, below) +
           getC(x, above) + getC(x, below) +
           getC(right,above) + getC(right,y) + getC(right,below);
    
  }
  
  void drawC(int x, int y) {
    color cellColor = color(0,0,0);
    int value;
    if (flipped) {
      value = a[x][y];
    }
    else {
     value = b[x][y];    
    }
    if (value > 0) {
      //print("on ");
      //print (x);
      //print (",");
      //println(y);
      
      cellColor = color(204,0,0);
    }
    fill(cellColor);
    rect(x*SIZE, y*SIZE, SIZE,SIZE);
   }   
    
  
  
  void setC(int x, int y, int value) {
    if (flipped) {
      a[x][y] = value;
    }
    else {
      b[x][y] = value;
    }
  }

  int getC(int x, int y) {
    if (flipped) {
      return b[x][y];
    }
    return a[x][y];
  }
  void flip() {
    flipped = ! flipped;
  }
  
  void update() {
    flip();

    for (int x = 0; x < GRID_SIZE; x++) {
      for (int y = 0; y < GRID_SIZE; y++) {
        int n = countNeighbors(x,y);
        if (getC(x,y) > 0) {
          if ((n < 2) || (n > 3)) {
            setC(x,y,0);
          }
          else {
            setC(x,y,1);
          }
        }
        else {
          if (n == 3) {
            setC(x,y,1);
          }
          else {
            setC(x,y,0);
          }
        }
      }
    }
  }
}


