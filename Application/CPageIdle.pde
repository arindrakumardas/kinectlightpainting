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
    CButton startButton = new CButton("refresh.png", width - 100, 0); //change to another image
    startButton.Init();
    this.AddChild(startButton);
    
    
    
    return true;
  } 
}
