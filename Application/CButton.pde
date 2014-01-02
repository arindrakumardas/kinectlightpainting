/* --------------------------------------------------------------------------
 * @author:  irene
 * date:  2/1/2014 (m/d/y)
 * ----------------------------------------------------------------------------
 */
PImage Img;
float fImgSize;

public class CButton extends CSprite {

  boolean bButtonOver = false;

  CButton (String strNormalImgPath, int fPosX, int fPosY) {
    Img = loadImage(strNormalImgPath);
    fImgSize = 50;
    image(Img, fPosX, fPosY, fImgSize, fImgSize);
  }

  void OnMouseOver() {
    update(g_inputController.GetX(), g_inputController.GetY());
    noStroke();
    if (this.bButtonOver) {
      ellipse(this.fPosX+this.fImgSize/2, this.fPosY+this.fImgSize/2, this.fImgSize, this.fImgSize);
      ellipseMode(CENTER);
    } 
    else {
      background(0);   //erases the circle over selection
    }
  }

  void update(float fPosX, float fPosY) {
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
    }
  }

  boolean bOverButton(float fPosX, float fPosY, float width, float height) {
    if (g_inputController.GetX() >= fPosX && g_inputController.GetX() <= fPosX+width && 
      g_inputController.GetY() >= fPosY && g_inputController.GetY() <= fPosY+height) {
      return true;
    } 
    else {
      return false;
    }
  }
}

