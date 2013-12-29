/* --------------------------------------------------------------------------
 * This implements the buttons
 * @author:  irene
 * date:  29/12/2012 (m/d/y)
 * last update implements the home and refresh buttons
 * ----------------------------------------------------------------------------
 */

public class CButton extends CNode {

  PImage imgRefresh, imgHome;  // Declare variable "a" of type PImage
  int iImgRefX, iImgRefY, iImgHomX, iImgHomY;  // Position of buttons
  int iImgRefSize = 50;
  int iImgHomSize = 50;
  boolean bHomeOver = false;
  boolean bRefreshOver = false;

  void setup() {
    size(640, 480); //size of the canvas
    background(0, 0, 0);
    imgRefresh = loadImage("refresh.png");  // Load the image into the program
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
      ellipse(this.iImgRefX+this.iImgRefSize/2, this.iImgRefY+this.iImgRefSize/2, this.iImgRefSize, this.iImgRefSize);
      ellipseMode(CENTER);
    } 
    else if (this.bHomeOver) {
      ellipse(this.iImgHomX+this.iImgHomSize/2, this.iImgHomY+this.iImgHomSize/2, this.iImgHomSize, this.iImgHomSize);
      ellipseMode(CENTER);
    } 
    else {
      background(0);   //erases the circle over selection
    }
    image(imgRefresh, iImgRefX, iImgRefY, iImgRefSize, iImgRefSize);
    image(imgHome, iImgHomX, iImgHomY, iImgHomSize, iImgHomSize);
  }

  void update(int x, int y) {
    if ( overRefresh(this.iImgRefX, this.iImgRefY, this.iImgRefSize, this.iImgRefSize) ) {
      this.bRefreshOver = true;
      this.bHomeOver = false;
    } 
    else if ( overHome(this.iImgHomX, this.iImgHomY, this.iImgHomSize, this.iImgHomSize) ) {
      this.bHomeOver = true;
      this.bRefreshOver = false;
    } 
    else {
      this.bRefreshOver = this.bHomeOver = false;
    }
  }

  void mousePressed() {
    if (this.bRefreshOver) { 
      g_pageController.GotoPageIdle(); // not sure if this is the right page, please check it
    }
    if (this.bHomeOver) {
      g_pageController.GotoPageCapture(); // not sure if this is the right page, please check it
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

