/* --------------------------------------------------------------------------
 * CPageIdle 
 * author:  Gigi Ho
 * date:  15/12/2012 
 * ----------------------------------------------------------------------------
 */

class CPageIdle extends CScene{
  CPageIdle(){
    super();
  }

  boolean Init(){
    if(!super.Init()){
      return false;
    }
    
    CLogger.Debug("[CPageIdle.Init]");
    
    //Init drawable components inside CLayer
    CLabel testLabel = new CLabel("This is PageIdle");  
    testLabel.fFontSize = 20;
    testLabel.SetPosition(width/2,20);
    this.AddChild(testLabel);
    
    //Create canvas
    CCanvas canvas = new CCanvas();
    canvas.Init();
    this.AddChild(canvas);
    
    //Create button
    CButton startButton = new CButton("StartBtn", width - 100, 30, "start.png", "start-neg.png", "Start capturing"); //change to another image
    startButton.Init();
//    this.AddChild(startButton);
    
    //Create label for start button
    CLabel startLabel = new CLabel("Start capturing");      // I would like it on MouseOver -ire
    startLabel.fFontSize = 8;
    startLabel.SetPosition(width-75, 30+60);    //(-75,60) is the distance from position, for this I'm not writing 90 instead
    this.AddChild(startLabel);
    
   
    return true;
  }
  
    
  public void ControlEventHandler(ControlEvent theEvent) {
    CLogger.Debug("CPageIdle.ControlEvent(). Name:" + theEvent.getName() + " Value:" + theEvent.getValue());
    CLogger.Debug("CPageIdle.ControlEvent(). " + theEvent);
    
    if(theEvent.getName() == "StartBtn"){
      g_pageController.GotoPageCapture();
    }
  }
}
