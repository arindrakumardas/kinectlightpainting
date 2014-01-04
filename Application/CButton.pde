/* --------------------------------------------------------------------------
 * @author:  irene
 * date:  2/1/2014 (m/d/y)
 * ----------------------------------------------------------------------------
 */


public class CButton extends CNode implements IDrawable {

  PImage imgNormalImage;
  
  PImage imgSelectedImage;
  float fImgSize = 50;
  boolean bButtonOver = false;
  String strBtnInfo;
  

  //@depecated
  CButton (String strNormalImgPath, float fPosX, float fPosY) {
    imgNormalImage = loadImage(strNormalImgPath);
    this.SetPosition(fPosX, fPosY);
    
  }
  
  CButton (String strBtnName, float fPosX, float fPosY, String strNormalImgPath, String strSelectedImgPath, String strBtnInfo) {
    imgNormalImage = loadImage(strNormalImgPath);
    imgNormalImage.resize(int(fImgSize), int(fImgSize));
    imgSelectedImage = loadImage(strSelectedImgPath);
    imgSelectedImage.resize(int(fImgSize), int(fImgSize));
    this.SetPosition(fPosX, fPosY);
    
    
    Button thisBtn = g_cp5Controller.addButton(strBtnName);
    thisBtn.setPosition(fPosX,fPosY)
//         .setSize(int(fImgSize),int(fImgSize))
         .setImage(imgNormalImage, Controller.DEFAULT) // Controller.DEFAULT (background) Controller.OVER (foreground) Controller.ACTIVE (active)
         .setImage(imgSelectedImage, Controller.OVER) // Controller.DEFAULT (background) Controller.OVER (foreground) Controller.ACTIVE (active)
         .setCaptionLabel(strBtnInfo)
         .updateSize()
         ;
    
/*    if (g_cp5Controller.onMouseOver()) {
        CLabel btnLabel = new CLabel(strBtnInfo);
        btnLabel.fFontSize = 8;
        btnLabel.SetPosition(width-75, fPosY+60);
        this.AddChild(btnLabel);  
      }
*/
  }

  void Draw(){
    this.Update();
    
    image(imgNormalImage, this.GetPositionX(), this.GetPositionY(), fImgSize, fImgSize);
    

  }

/* ----------- I think this one can be deleted, as it is covered by ControlP5 -------------- ire 
  void OnMouseOver() {
    update(g_inputController.GetX(), g_inputController.GetY());
    noStroke();
    if (this.bButtonOver) {
      ellipse(this.GetPositionX()+this.fImgSize/2, this.GetPositionY()+this.fImgSize/2, this.fImgSize, this.fImgSize);
      ellipseMode(CENTER);
    } 
    else {
      background(0);   //erases the circle over selection
    }
  }

  void update(float fPosX, float fPosY) {
    if ( bOverButton(this.GetPositionX(), this.GetPositionY(), this.fImgSize, this.fImgSize) ) {
      this.bButtonOver = true;
    } 
    else {
      this.bButtonOver = false;
    }
  }

  /*void mousePressed() {
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
*/  
}

