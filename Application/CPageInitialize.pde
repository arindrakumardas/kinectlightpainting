/* --------------------------------------------------------------------------
 * CPageInitialize 
 * author:  Irene
 * date:  4/1/2014 
 * ----------------------------------------------------------------------------
 */

class CPageInitialize extends CScene implements ITimerHandler {

  int iInitialTime = 4; //in sec

  CPageInitialize() {
    super();
  }


  boolean Init() {
    if (!super.Init()) {
      return false;
    }

    CLogger.Debug("[CPageInitialize.Init]");

    //Init drawable components inside CLayer
    CLabel testLabel = new CLabel("This is PageInitialize");  
    testLabel.fFontSize = 20;
    testLabel.SetPosition(width/2, 20);
    this.AddChild(testLabel);


    CTimerLabel countdownTimer = new CTimerLabel(this, iInitialTime); //count down 4sec
    countdownTimer.Init();
    countdownTimer.fFontSize = 20;
    countdownTimer.SetPosition(width/2, height/2);
    countdownTimer.bDisplayLabel = false; //uncomment this if dont want to display the label
    this.AddChild(countdownTimer);


    return true;
  }

  void Draw() {   
    //@attn: irene
    //This is the line that is essential, always call parent's function when you overwrite them
    super.Draw();
    
    tint(127);  // this is supposed to be for opacity at 50%    
    
    Knob timeKnob = g_cp5Controller.addKnob("initializing...")
                                    .setRange(iInitialTime, 0)
                                      .setValue(iInitialTime-millis()/1000)  //can we have the countdown here? -ire
                                        .setPosition(width/2, height/2)
                                          .setRadius(50)
                                            .setColorForeground(color(255))
                                              .setColorBackground(color(100))
                                                .setColorActive(color(255, 255, 0))
                                                ;

  }

  //CTimer callback
  public void TimeIsUp() {
    g_pageController.GotoPageCapture();
  }
}

