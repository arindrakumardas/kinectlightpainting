class CPageInitialize extends CScene implements ITimerHandler {

  PImage imgOpen = null;
  float fDiameter;  

  CPageInitialize() {
    super();
  }

  boolean Init() {
    if (!super.Init()) {
      return false;
    }

    CLogger.Debug("[CPageInitialize.Init]");

    imgOpen = loadImage("shutter.png");

    CTimerLabel countdownTimer = new CTimerLabel(this); //count down 6sec
    countdownTimer.Init();
    countdownTimer.fFontSize = 40;
    countdownTimer.SetPosition(width - 75, height/3);
    countdownTimer.bDisplayLabel = false; //uncomment this if dont want to diaply the label
    this.AddChild(countdownTimer);
    countdownTimer.StartTimer(CameraFocusSound.length()/1000);

    CameraFocusSound.play();
    CameraFocusSound.rewind();

    this.fDiameter = millis()/1000;
    

      //Init drawable components inside CLayer
      /* CLabel testLabel = new CLabel("This is PageInitialize");  
       testLabel.fFontSize = 20;
       testLabel.SetPosition(width/2, 20);
       this.AddChild(testLabel);
       */
      return true;
  }

  public void Draw() {
    super.Draw();
    imageMode(CENTER);
    image(imgOpen, width/2, height/2, 600, 600);
    fill(150);
    ellipse(width/2, height/2, this.fDiameter, this.fDiameter);
    this.fDiameter -= 6;
  }


  //CTimer callback
  public void TimeIsUp(int iTag) {
    g_pageController.GotoPageCapture();
    delay(400);
  }
}

