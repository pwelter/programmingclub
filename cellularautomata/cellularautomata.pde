/* @pjs crisp=true; 
 */

int SIZE = 4;
int GRID_SIZE = 100;


Grid g = new Grid();

void setup() {
  size(SIZE*GRID_SIZE,SIZE*GRID_SIZE);
  frameRate(20);
  g.init();
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
  int row = 0;
  int[] rules = { 30, 54, 60, 62, 90, 94, 102, 110, 122, 126, 150, 158, 182, 188, 190, 220, 222, 250 };
  int ruleIndex = 0;
  
  Grid () {  
  } 
  
  void init() {
    setC(int(GRID_SIZE / 2),0,1);
  }
    
  void drawC(int x, int y) {
    color cellColor = color(0,0,0);
    int value = a[x][y];
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
      a[x][y] = value;
  }

  int getC(int x, int y) {
    return a[x][y];
  }
  
  void reset() {
    for (int x = 0; x < GRID_SIZE; x++) {
      for (int y = 0; y < GRID_SIZE; y++) {
       setC(x,y,0);   
      }
    }
    row = 0;
    ruleIndex += 1;
    if (ruleIndex == rules.length) {
      ruleIndex = 0;
    }
    init();
  }  
  void update() {
    if (row >= (GRID_SIZE-1)) {
      reset();
    }      
    for (int x = 0; x < GRID_SIZE; x++) {
      int left = x - 1;
      int right = x + 1;
      if (left < 0) { left = GRID_SIZE - 1; }
      if (right == GRID_SIZE) { right = 0; }

      int stateIndex = getC(right,row) + (getC(x,row)*2) + (getC(left,row)*4);
      int value = rules[ruleIndex] >> stateIndex & 0x01;
      setC(x,row+1,value);
    }
    row += 1;
  }
}

