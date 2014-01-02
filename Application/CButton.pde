/* --------------------------------------------------------------------------
 * This code is better written for implementing buttons
 * but I haven't figured out yet how to load the image in CSprite
 * @author:  irene
 * date:  2/1/2014 (m/d/y)
 * ----------------------------------------------------------------------------
 */
PImage img;
float fPosX = 0; 
float fPosY = 0;
float fImgSize;

public class CButton extends CSprite {

  boolean bButtonOver = false;

  CButton (PImage img, int x, int y) {
    fPosX = x;
    fPosY = y;
    fImgSize = 50;
  }

  void OnMouseOver() {
    update(mouseX, mouseY);
    noStroke();
    if (this.bButtonOver) {
      ellipse(this.fPosX+this.fImgSize/2, this.fPosY+this.fImgSize/2, this.fImgSize, this.fImgSize);
      ellipseMode(CENTER);
    } 
    else {
      background(0);   //erases the circle over selection
    }
    image(img, fPosX, fPosY, fImgSize, fImgSize);
  }

  void update(int x, int y) {
    if ( bOverButton(this.fPosX, this.fPosY, this.fImgSize, this.fImgSize) ) {
      this.bButtonOver = true;
    } 
    else {
      this.bButtonOver = false;
    }
  }

  void mousePressed() {
    if (this.bButtonOver) { 
      g_pageController.GotoPageCapture(); // not sure if this is the right page, please check it
      background(255, 34, 55);
    }
  }

  boolean bOverButton(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } 
    else {
      return false;
    }
  }
}

