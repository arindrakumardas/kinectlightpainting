/* --------------------------------------------------------------------------
 * CPageInitialize 
 * author:  Irene
 * date:  4/1/2014 
 * ----------------------------------------------------------------------------
 */

class CPageInitialize extends CScene implements ITimerHandler {

  int iInitialTime = 4; //in sec
  
  CTimerLabel animationTimer = null;

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

    
    CTimerLabel countdownTimer = new CTimerLabel(this); //count down 4sec
    countdownTimer.Init();
    countdownTimer.iTag = 1;
    countdownTimer.fFontSize = 30;
    countdownTimer.strFontName = "ArialBlack";
    countdownTimer.SetPosition(width/2, height/2);
//    countdownTimer.bDisplayLabel = false; //uncomment this if dont want to display the label
    this.AddChild(countdownTimer);
    countdownTimer.StartTimer(iInitialTime);
    
  //Create button
    CButton redTimer = new CButton("redTimer.png"); //change to another image
    redTimer.Init();
    redTimer.SetPosition(100, 30);
    redTimer.cCol=color(255,0);
    this.AddChild(redTimer); 
    

    //another timer to trigger GotoPageCapture when above is done
    //will be triggered when the countdownTimer is done
    //this is done here because we cannot call AddChild inside Draw().
    this.animationTimer = new CTimerLabel(this); //count down 4sec
    this.animationTimer.Init();
    this.animationTimer.iTag = 2;  //the second timer for animation
    this.animationTimer.SetPosition(width/2, height/2);
    this.animationTimer.bDisplayLabel = false;
    this.AddChild(this.animationTimer);

   //player1.loop();
    return true;
  }

  void Draw() {   
    //@attn: irene
    //This is the line that is essential, always call parent's function when you overwrite them
    super.Draw();
    
    /* commented out to avoid errors
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
                                                */


  }

  //CTimer callback
  public void TimeIsUp(int iTag) {
    CLogger.Debug("[CPageInitialize.TimeIsUp] timerTag: " + iTag);
    if(iTag == 1){
      //play shutter animation
      
      //play shutter open sound
      
      //trigger another timer to GoTo next page when animation is done.
      float fAnimationTime = 0.5;
      this.animationTimer.StartTimer(fAnimationTime);

      
    }else if(iTag == 2){
      
    
      g_pageController.GotoPageCapture();
    }
  }
  
}


