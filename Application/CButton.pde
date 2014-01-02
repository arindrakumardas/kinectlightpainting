/* --------------------------------------------------------------------------
 * This implements the buttons
 * @author:  irene
 * date:  29/12/2012 (m/d/y)
 * last update implements the home and refresh buttons
 * ----------------------------------------------------------------------------
 */

//@attn: erini
//@by: gigi
//please read the general comments I sent you in Yammer first, because it covers the major required changes
//then you can see below comments before you revise your codes
public class CButton extends CNode {

  
  //@attn: erini
  //one button may need at least 2 images usually, i.e. normalImage, selectedImage. an optional one can be disabledImage.
  //normalImage is shown usually, when the button is being mouse-clicked or gesture-selected (hand left on button for more than 3sec), then selectedImage will be shown instead
  PImage imgRefresh, imgHome;
  
  //@attn: erini
  //does below stand for X,Y positions of the button? if yes, please use the variables from CNode.
  int iImgRefX, iImgRefY, iImgHomX, iImgHomY;
  int iImgSize = 50;
  
  //@attn: erini
  //word "selected" may represent the selected state of button more than "over" because a mouse-over / hand-over action may not mean a select action.
  boolean bHomeOver = false;
  boolean bRefreshOver = false;
  
  //@attn: erini
  //some possible contructor
  CButton(String strNormalImgPath, String strSelectedImgPath){
  }

  void setup() {
    size(640, 480);
    background(0, 0, 0);
    //@attn:erini
    //below properties should be defined when creating a new object of CButton
    imgRefresh = loadImage("refresh.png"); 
    iImgRefX = 550;
    iImgRefY = 30;
    imgHome = loadImage("home.png");
    iImgHomX = 550;
    iImgHomY = 350;
  }

  //@attn: erini
  //don't use draw() outside the main program, i.e. Application.pde
  void draw() {
    //@attn: erini
    // use "g_inputController.GetX()" instead global variable mouseX/ mouseY because the input might be kinect instead of the cursor mouse .
    update(mouseX, mouseY);

    noStroke();
    if (this.bRefreshOver) {
      ellipse(this.iImgRefX+this.iImgSize/2, this.iImgRefY+this.iImgSize/2, this.iImgSize+10, this.iImgSize+10);
      ellipseMode(CENTER);
      //@attn: erini
      //are you trying to create a label here? if yes, you may consider to make use of CLabel
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

  //@attn: erini
  //a button handler (a function) which define what will happen when the button is selected should be defined together when creating a CButton object
  //(just like when you define the button normalImage) and passed to the class when you create an object (passed as a function pointer or something)
  //function pointer is a technique I used in c++ but I will check again how this can be done in java.
  void mousePressed() {
    if (this.bRefreshOver) { 
      g_pageController.GotoPageCapture(); // not sure if this is the right page, please check it
    }
    if (this.bHomeOver) {
      g_pageController.GotoPageIdle(); // not sure if this is the right page, please check it
    }
  }

  //@attn: erini
  //use upper camel case as functions names
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

