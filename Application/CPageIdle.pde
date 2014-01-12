/* --------------------------------------------------------------------------
 * CPageIdle 
 * author:  Gigi Ho
 * date:  15/12/2012 
 * ----------------------------------------------------------------------------
 */

class CPageIdle extends CScene implements IButtonHandler {
  
  
  CPageIdle() {
    super();
  }

  boolean Init() {
    if (!super.Init()) {
      return false;
    }

    CLogger.Debug("[CPageIdle.Init]");

    //Init drawable components inside CLayer
  /* CLabel testLabel = new CLabel("This is PageIdle");  
    testLabel.fFontSize = 20;
    testLabel.SetPosition(width/2, 20);
    this.AddChild(testLabel);
    */

    //Create button
    //CButton startButton = new CButton("StartBtn", width - 100, 30, "start.png", "start-neg.png", "Start capturing"); //change to another image
    CButton startButton = new CButton("start.png"); //change to another image
    startButton.Init(width - 75, height/7, "Start capturing");
    startButton.SetHandler(this);
    this.AddChild(startButton); //the CButton is added by CP5 so no need to be added to the Layer

    //Create label for start button
    CLabel startLabel = new CLabel("Start capturing");
    startLabel.fFontSize = 12;
    startLabel.SetPosition(width-75, height/7+35);    //(-100,30) is the distance from position, for this I'm not writing 90 instead
    this.AddChild(startLabel); 

    //Create canvas (create canvas after because the cursor can be drawn over the above ui compoment)
    CCanvas canvas = new CCanvas();
    canvas.Init();
    this.AddChild(canvas);
    return true;
  }

//  public void ControlEventHandler(ControlEvent theEvent) {
//    CLogger.Debug("CPageIdle.ControlEvent(). " + theEvent);
//
//    if (theEvent.getName() == "StartBtn") {
//      g_pageController.GotoPageInitialize();
//    }
//  }


  /*  public void Draw(){
    super.Draw();
    g_inputManager.DrawAllCursor();
    image(HandCalibration, width/2-30, HandCalibration.height / 2);
    }
*/

  // Implementing IButtonHanlder callback
  public void OnButtonSelected(int iBtnTag) {
    CLogger.Info("[CPageIdle.OnButtonSelected] button selected. buttonTag: " + iBtnTag);
    g_pageController.GotoPageCapture();
  }
  

  
}


