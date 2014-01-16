/* --------------------------------------------------------------------------
 * CPageCapture 
 * author:  Gigi Ho
 * date:  15/12/2012 
 * ----------------------------------------------------------------------------
 */

class CPageCapture extends CScene implements ITimerHandler {

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

    //Draw button panel background
    CSprite panelBg = new CSprite(SHAPE_RECT, width*0.8, 0);
    panelBg.iAnchor = CORNER;
    panelBg.iWidth = int(width*0.2);
    panelBg.iHeight = height;
    this.AddChild(panelBg);

    CTimerLabel countdownTimer = new CTimerLabel(this); //count down 6sec
    countdownTimer.Init();
    countdownTimer.fFontSize = 40;
    countdownTimer.SetPosition(width - 75, height/3);
    //    countdownTimer.bDisplayLabel = false; //uncomment this if dont want to diaply the label
    this.AddChild(countdownTimer);
    countdownTimer.StartTimer(iExposureTime);
    delay(500);

    fStartTime = millis()/1000;    //this is reseting the timer every time you go to PageCapture    

    //Create canvas (create canvas after because the cursor can be drawn over the above ui compoment)
    this.canvas = new CCanvas();
    this.canvas.Init(true);
    this.AddChild(this.canvas);



    return true;
  }

  void Draw() {   
    //@attn: irene
    //This is the line that is essential, always call parent's function when you overwrite them
    super.Draw();

    noStroke();
    //Create red light indicator
    fill(255, 0, 0, 100);
    ellipse(width - 75, height/7, 30, 30); 
    this.fCaptureTime = millis()/1000 - this.fStartTime;

    //Create record label
    CLabel recordingLabel = new CLabel("RECORDING");
    recordingLabel.fFontSize = 10;
    recordingLabel.SetPosition(width-75, height/7+30);
    this.AddChild(recordingLabel);

    if (this.fCaptureTime%2 == 1) {
      fill(0);
      ellipse(width - 75, height/7, 18, 18); 
      CameraBeepSound.unmute();
      CLogger.Debug("Vintage");
    } 
    else {
      CameraBeepSound.play();
      CameraBeepSound.rewind();
      CameraBeepSound.mute();
      fill(255, 0, 0, 200);
      ellipse(width - 75, height/7, 18, 18);
    }
  }

  //CTimer callback
  public void TimeIsUp(int iTag) {
    this.canvas.SaveDrawing();
    g_pageController.GotoPageDisplay();
    //    delay(400);
  }
}

