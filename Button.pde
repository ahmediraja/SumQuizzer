class Button {

  PVector bPos;
  float bHeight;
  float bWidth;
  String text;

  Button(PVector _bPos, float _bWidth, float _bHeight, String _text) {
    bPos = _bPos;
    bHeight = _bHeight;
    bWidth = _bWidth;
    text = _text;
  }

  boolean overRect() {
    if (mouseX >= bPos.x-(bWidth/2) && mouseX <= bPos.x+(bWidth/2) && 
      mouseY >= bPos.y-(bHeight/2) && mouseY <= bPos.y+(bHeight/2)) {
      return true;
    } else {
      return false;
    }
  }
  
  void drawButton() {
    if (overRect()) {
      fill(205);
    } else {
      fill(255);
    }
    rectMode(CENTER);
    strokeWeight(5);
    rect(bPos.x, bPos.y, bWidth, bHeight, 15);
    
    textAlign(CENTER, CENTER);
    textSize(40);
    fill(0);
    text(text, bPos.x, bPos.y);
  }

  void update() {
    drawButton();
  }
}
