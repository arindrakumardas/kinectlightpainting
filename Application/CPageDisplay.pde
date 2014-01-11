/* --------------------------------------------------------------------------
 * CPageDisplay 
 * author:  Gigi Ho
 * date:  15/12/2012 
 * ----------------------------------------------------------------------------
 */

class CPageDisplay extends CScene implements IButtonHandler {
  protected final int TAG_HOME_BTN = 1;
  protected final int TAG_REFRESH_BTN = 2;
  
  PImage imgRecordedDrawing = null;
  
  
  CPageDisplay() {
    super();
  }

  boolean Init() {
    
    if (!super.Init()) {
      return false;
    }

    CLogger.Debug("[CPageDisplay.Init]");
    CameraShutterSound.rewind();
    CameraShutterSound.play();

    //Init drawable components inside CLayer
  /*  CLabel testLabel = new CLabel("This is PageDisplay");  
    testLabel.fFontSize = 20;
    testLabel.SetPosition(width/2, 20);
    this.AddChild(testLabel);
*/
    //Create button
//    CButton refreshButton = new CButton("RefreshBtn", width - 100, 30, "refresh.png", "refresh-neg.png", "Start over"); //change to another image
    CButton refreshButton = new CButton("refresh.png"); //change to another image
    refreshButton.Init();
    refreshButton.SetHandler(this);
    refreshButton.SetPosition(width - 75, height/7);
    refreshButton.strBtnCaption = "Start over";
    refreshButton.iTag = TAG_REFRESH_BTN;
    this.AddChild(refreshButton); 

/* ------------- do you think this can be added in CButton? ----------------------- ire   */    
    //Create label for refresh button
    CLabel refreshLabel = new CLabel("Start over");
    refreshLabel.fFontSize = 8;
    refreshLabel.SetPosition(width-75, height/7+35);
    this.AddChild(refreshLabel);
 

    //Create button
//    CButton homeButton = new CButton("HomeBtn", width - 100, 350, "home.png", "home-neg.png", "Home screen"); //change to another image
    CButton homeButton = new CButton("home.png"); //change to another image
    homeButton.Init();
    homeButton.SetHandler(this);
    homeButton.SetPosition(width - 75, height-height/5);
    homeButton.strBtnCaption = "Go to Home";
    homeButton.iTag = TAG_HOME_BTN;
    this.AddChild(homeButton); 
    
/* ------------- also in CButton? ----------------------- ire */    
    //Create label for home button
      CLabel homeLabel = new CLabel("Home screen");
      homeLabel.fFontSize = 8;
      homeLabel.SetPosition(width-75, height-height/5+35);
      this.AddChild(homeLabel);
      
      
      this.imgRecordedDrawing = loadImage(Configs.SAVED_DRAWING_FILEPATH);


    return true;
  }
  
  public void Draw(){
    super.Draw();
    g_inputManager.DrawAllCursor();
    image(this.imgRecordedDrawing, width/2,height/2);
          
  }
  
//  public void ControlEventHandler(ControlEvent theEvent) {
//    CLogger.Debug("CPageIdle.ControlEvent(). Name:" + theEvent.getName() + " Value:" + theEvent.getValue());
//    CLogger.Debug("CPageIdle.ControlEvent(). " + theEvent);
//    
//    if(theEvent.getName() == "HomeBtn"){
//      g_pageController.GotoPageIdle();
//    }
//    if (theEvent.getName() == "RefreshBtn"){
//      g_pageController.GotoPageInitialize();
//    }
//  }
  
  // Implementing IButtonHanlder callback
  public void OnButtonSelected(int iBtnTag) {
    CLogger.Info("[CPageIdle.OnButtonSelected] button selected. buttonTag: " + iBtnTag);
    if(iBtnTag == TAG_HOME_BTN){ //Home button
      g_pageController.GotoPageIdle();
    }else if (iBtnTag == TAG_REFRESH_BTN){
      g_pageController.GotoPageCapture();
    }
    
  }
}
