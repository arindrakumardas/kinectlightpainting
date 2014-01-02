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
    CButton refreshButton = new CButton("refresh.png", width - 100, 30);
    refreshButton.Init();
    this.AddChild(refreshButton); 
    
    //Create label for refresh button
    CLabel refreshLabel = new CLabel("Start over");  // I would like it on MouseOver -ire
    refreshLabel.fFontSize = 8;
    refreshLabel.SetPosition(width-75, 30+60);
    this.AddChild(refreshLabel);

    //Create button
    CButton homeButton = new CButton("home.png", width - 100, 350);
    homeButton.Init();
    this.AddChild(homeButton); 
    
    //Create label for home button
    CLabel homeLabel = new CLabel("Home screen");  // I would like it on MouseOver -ire
    homeLabel.fFontSize = 8;
    homeLabel.SetPosition(width-75, 350+60);
    this.AddChild(homeLabel);



    return true;
  }
}

