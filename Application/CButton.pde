/* --------------------------------------------------------------------------
 * This implements the buttons
 * @author:  irene
 * date:  29/12/2012 (m/d/y)
 * last update implements the home and refresh buttons
 * ----------------------------------------------------------------------------
 */

public class CButton extends CNode {

  PImage imgRefresh, imgHome;
  int iImgRefX, iImgRefY, iImgHomX, iImgHomY;
  int iImgSize = 50;
  boolean bHomeOver = false;
  boolean bRefreshOver = false;

  void setup() {
    size(640, 480);
    background(0, 0, 0);
    imgRefresh = loadImage("refresh.png"); 
    iImgRefX = 550;
    iImgRefY = 30;
    imgHome = loadImage("home.png");
    iImgHomX = 550;
    iImgHomY = 350;
  }

  void draw() {
    update(mouseX, mouseY);

    noStroke();
    if (this.bRefreshOver) {
      ellipse(this.iImgRefX+this.iImgSize/2, this.iImgRefY+this.iImgSize/2, this.iImgSize+10, this.iImgSize+10);
      ellipseMode(CENTER);
      text("Start over", this.iImgRefX+this.iImgSize/2, this.iImgRefY+1.5*this.iImgSize);
      textAlign(CENTER);
    } 
    else if (this.bHomeOver) {
      ellipse(this.iImgHomX+this.iImgSize/2, this.iImgHomY+this.iImgSize/2, this.iImgSize+10, this.iImgSize+10);
      ellipseMode(CENTER);
      text("Home screen", this.iImgHomX+this.iImgSize/2, this.iImgHomY+1.5*this.iImgSize);
      textAlign(CENTER);
    } 
    else {
      background(0);   //erases the circle over selection
    }
    image(imgRefresh, iImgRefX, iImgRefY, iImgSize, iImgSize);
    image(imgHome, iImgHomX, iImgHomY, iImgSize, iImgSize);
  }

  void update(int x, int y) {
    if ( overRefresh(this.iImgRefX, this.iImgRefY, this.iImgSize, this.iImgSize) ) {
      this.bRefreshOver = true;
      this.bHomeOver = false;
    } 
    else if ( overHome(this.iImgHomX, this.iImgHomY, this.iImgSize, this.iImgSize) ) {
      this.bHomeOver = true;
      this.bRefreshOver = false;
    } 
    else {
      this.bRefreshOver = this.bHomeOver = false;
    }
  }

  void mousePressed() {
    if (this.bRefreshOver) { 
      g_pageController.GotoPageCapture(); // not sure if this is the right page, please check it
    }
    if (this.bHomeOver) {
      g_pageController.GotoPageIdle(); // not sure if this is the right page, please check it
    }
  }

  boolean overRefresh(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } 
    else {
      return false;
    }
  }

  boolean overHome(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } 
    else {
      return false;
    }
  }
}

