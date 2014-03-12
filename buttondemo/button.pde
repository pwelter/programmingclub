class Button {
   String label;
   boolean pressed = false;
   int x = 10;
   int y = 10;
   int fontSize = 28;
   
   Button(String s) {
     label = s;
   }
   void setFontSize(int size) {
     fontSize = size;
   }
   void setPosition(int left,int top) {
     x = left;
     y = top;
   }
   
   void draw() {
     textSize(fontSize);
     float width = textWidth(label);
     if (pressed) {
       fill(0,255,0);
     }
     else {
       fill(128);
     }
     rect(x,y,width,textHeight() + 4);
     fill(0);
     text(label,x,y + 2 + textAscent() );
   }
   
   float textHeight() {
     textSize(fontSize);
     return textAscent() + textDescent();
   }
   
   boolean clickedIn(int mx, int my) {
     textSize(fontSize);
     float width = textWidth(label);
     if ((mx >= x) && (mx <= (x + width))) {
       if ((my >= y) && (my <= (my + (textHeight() + 4)))) {
          return true;
       }
     }
    return false;
   } 

   void toggle() {
      pressed = ! pressed;
   }
  
}
