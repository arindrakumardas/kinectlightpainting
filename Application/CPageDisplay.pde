/* --------------------------------------------------------------------------
 * CPageDisplay 
 * author:  Gigi Ho
 * date:  15/12/2012 
 * ----------------------------------------------------------------------------
 */

class CPageDisplay extends CScene {
  CPageDisplay() {
    super();
  }

  boolean Init() {
    if (!super.Init()) {
      return false;
    }

    CLogger.Debug("[CPageDisplay.Init]");

    //Init drawable components inside CLayer
    CLabel testLabel = new CLabel("This is PageDisplay");  
    testLabel.fFontSize = 20;
    testLabel.SetPosition(width/2, 20);
    this.AddChild(testLabel);

    //Create button
    CButton refreshButton = new CButton("RefreshBtn", width - 100, 30, "refresh.png", "refresh-neg.png", "Start over"); //change to another image
    refreshButton.Init();
    // this.AddChild(refreshButton); 

/* ------------- do you think this can be added in CButton? ----------------------- ire   */    
    //Create label for refresh button
    CLabel refreshLabel = new CLabel("Start over");
    refreshLabel.fFontSize = 8;
    refreshLabel.SetPosition(width-75, 30+60);
    this.AddChild(refreshLabel);
 

    //Create button
    CButton homeButton = new CButton("HomeBtn", width - 100, 350, "home.png", "home-neg.png", "Home screen"); //change to another image
    homeButton.Init();
    // this.AddChild(homeButton); 
    
/* ------------- also in CButton? ----------------------- ire */    
    //Create label for home button
      CLabel homeLabel = new CLabel("Home screen");
      homeLabel.fFontSize = 8;
      homeLabel.SetPosition(width-75, 350+60);
      this.AddChild(homeLabel);


    return true;
  }
  
  
  public void ControlEventHandler(ControlEvent theEvent) {
    CLogger.Debug("CPageIdle.ControlEvent(). Name:" + theEvent.getName() + " Value:" + theEvent.getValue());
    CLogger.Debug("CPageIdle.ControlEvent(). " + theEvent);
    
    if(theEvent.getName() == "HomeBtn"){
      g_pageController.GotoPageIdle();
    }
    if (theEvent.getName() == "RefreshBtn"){
      g_pageController.GotoPageCapture();
    }
  }
}

