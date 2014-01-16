/* --------------------------------------------------------------------------
 * CPageDisplay 
 * author:  Gigi Ho
 * date:  15/12/2012 
 * ----------------------------------------------------------------------------
 */

class CPageDisplay extends CScene implements IButtonHandler {
  protected final int TAG_HOME_BTN = 1;
  protected final int TAG_REFRESH_BTN = 2;

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

    //Display finished drawings
    CSprite recordedBg = new CSprite(Configs.SAVED_BACKGROUND_FILEPATH, 0, 0);
    recordedBg.iAnchor = CORNER;
    this.AddChild(recordedBg);

    CSprite recordedDrawing = new CSprite(Configs.SAVED_DRAWING_FILEPATH, 0, 0);
    recordedDrawing.iAnchor = CORNER;
    this.AddChild(recordedDrawing);
    
    
    //Draw button panel background
    CSprite panelBg = new CSprite(SHAPE_RECT, width*0.8, 0);
    panelBg.iAnchor = CORNER;
    panelBg.iWidth = int(width*0.2);
    panelBg.iHeight = height;
    this.AddChild(panelBg);


    //Create button
    CButton refreshButton = new CButton("refresh.png"); //change to another image
    refreshButton.Init();
    refreshButton.SetHandler(this);
    refreshButton.SetPosition(width - 65, height/4);
    refreshButton.strBtnCaption = "Start over";
    refreshButton.iTag = TAG_REFRESH_BTN;
    this.AddChild(refreshButton); 

    //Create label for refresh button
    CLabel refreshLabel = new CLabel("Start again");
    refreshLabel.fFontSize = 14;
    textFont(SegoeUIFont);
    //    refreshLabel.cFontColor = color(255, 102, 0);
    refreshLabel.SetPosition(width-65, height/4+45);
    this.AddChild(refreshLabel);


    //Create button
    //    CButton homeButton = new CButton("HomeBtn", width - 100, 350, "home.png", "home-neg.png", "Home screen"); //change to another image
    CButton homeButton = new CButton("home.png"); //change to another image
    homeButton.Init();
    homeButton.SetHandler(this);
    homeButton.SetPosition(width - 65, height/2+50);
    homeButton.strBtnCaption = "Go to Home";
    homeButton.iTag = TAG_HOME_BTN;
    this.AddChild(homeButton); 

    //Create label for home button
    CLabel homeLabel = new CLabel("Home");
    homeLabel.fFontSize = 14;
    textFont(SegoeUIFont);
    //      homeLabel.cFontColor = color(255, 102, 0);
    homeLabel.SetPosition(width-65, height/2+95);
    this.AddChild(homeLabel);

    return true;
  }

  public void Draw() {
    super.Draw();
    g_inputManager.DrawAllCursor();


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
    if (iBtnTag == TAG_HOME_BTN) { //Home button
      g_pageController.GotoPageIdle();
    }
    else if (iBtnTag == TAG_REFRESH_BTN) {
      g_pageController.GotoPageInitialize();
    }
  }
}

