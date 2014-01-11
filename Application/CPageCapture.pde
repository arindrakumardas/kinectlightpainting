/* --------------------------------------------------------------------------
 * CPageCapture 
 * author:  Gigi Ho
 * date:  15/12/2012 
 * ----------------------------------------------------------------------------
 */

class CPageCapture extends CScene implements ITimerHandler{

  float fCaptureTime;
  float fStartTime;
  
  int iExposureTime = 6; //in sec
  
  protected CCanvas canvas = null; 

  CPageCapture() {
    super();
  }


  boolean Init() {
    if (!super.Init()) {
      return false;
    }

    CLogger.Debug("[CPageCapture.Init]");

    //Init drawable components inside CLayer
  /*  CLabel testLabel = new CLabel("This is PageCapture");  
    testLabel.fFontSize = 20;
    testLabel.SetPosition(width/2, 20);
    this.AddChild(testLabel);
*/
//    CTimer captureTime = new CTimer(fStartTime);
    CTimerLabel countdownTimer = new CTimerLabel(this); //count down 6sec
    countdownTimer.Init();
    countdownTimer.fFontSize = 12;
    countdownTimer.SetPosition(width - 75, height/4);
//    countdownTimer.bDisplayLabel = false; //uncomment this if dont want to diaply the label
    this.AddChild(countdownTimer);
    countdownTimer.StartTimer(iExposureTime);
    
    //Create canvas (create canvas after because the cursor can be drawn over the above ui compoment)
    this.canvas = new CCanvas();
    this.canvas.Init(true);
    this.AddChild(this.canvas);

    fStartTime = millis()/1000;    //this is reseting the timer every time you go to PageCapture
    
    return true;
  }
   
  void Draw() {   
    //@attn: irene
    //This is the line that is essential, always call parent's function when you overwrite them
    super.Draw();
   // CameraBeepSound.play();
   // CameraBeepSound.rewind();
    noStroke();
    //Create red light indicator
    fill(255, 0, 0, 100);
    ellipse(width - 75, height/7, 30, 30); 
    
    this.fCaptureTime = millis()/1000 - this.fStartTime;
    
  
    
    if (this.fCaptureTime%2 == 1) {
      fill(255, 0, 0, 200);
      ellipse(width - 75, height/7, 18, 18);
      CameraBeepSound.play();
      CameraBeepSound.rewind();
         //Create label for refresh button
    CLabel recordingLabel = new CLabel("Recording");
    recordingLabel.fFontSize = 10;
    recordingLabel.SetPosition(width-75, height/7+30);
    this.AddChild(recordingLabel);
 
    } 
    else {
      fill(0);
      ellipse(width - 75, height/7, 18, 18);
    }   
  }
      
  //CTimer callback
  public void TimeIsUp(int iTag){
    this.canvas.SaveDrawing();
    g_pageController.GotoPageDisplay();
  }
}

