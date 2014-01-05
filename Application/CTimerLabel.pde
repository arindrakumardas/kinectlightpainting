/* The CTimer is supposed to be used twice
 * once with a countdown of 6secs during capturing mode
 * and once with a countdown of 4secs during starting mode
 *
 * for this I was thinking to have as an input parameter the fStartTime
*/

public class CTimerLabel extends CLabel{
  public ITimerHandler handler = null;
  public float fTimerDurationSec = 5; //(in sec)Time duration that want to count down
  public boolean bDisplayLabel = true;
  public int iTag = -1; //tag can be used to distinguish timer from timer

  protected int iTimerTargetMSec = 0; //(in msec)
  protected int iTimerMSec = 0; //for keeping counting-down time (also the time that will be displayed)
  protected boolean bIsAlive = false; //set this false when the timer is finished.
  
  
  //below are not necessary now
  float fCaptureTime;
  float fStartTime;
  //@deperacated
  CTimerLabel (float fStartTime) {
    this.fCaptureTime = this.fStartTime - millis()/1000;
  }
  
  CTimerLabel(ITimerHandler timerHandler){
    this.handler = timerHandler;
  }
  
  public void StartTimer(float fTimerDurationSec){
    this.bIsAlive = true;
    
    this.fTimerDurationSec = fTimerDurationSec;
    this.iTimerTargetMSec = int(millis() + fTimerDurationSec*1000);
    this.iTimerMSec = int(fTimerDurationSec*1000);
    CLogger.Debug("[CTimer.StartTimer] iTag:" + iTag + " timerMSec:" + this.iTimerMSec);
    
  }
  
  public void Update(){
    if(!this.bIsAlive){
      return; //do not update if timer is done
    }
    super.Update();
    // keep time
    this.iTimerMSec = this.iTimerTargetMSec - millis(); //this is for counting down
    
    // callback when timer is up
    if(this.iTimerMSec < 0){
      if(this.handler == null){
        CLogger.Error("[CTimer.Update()]timer handler is null.");
      }
      
      CLogger.Debug("[CTimer.Update()]TimeIsUp. iTag: " + iTag + " iTimerMSec: " + iTimerMSec);
      this.bIsAlive = false;
      this.handler.TimeIsUp(iTag);
      
    }
  }
  
  public void Draw(){
    this.Update();
    //set label text before drawing
    float fTimerSec = float(this.iTimerMSec)/1000;
    this.strText = "" + round(fTimerSec); //use round so that both the starting sec or ending sec can be displayed
//    CLogger.Debug("[CTimer.Draw()] before draw, timerSec:" + fTimerSec + " iTimerMSec:" + iTimerMSec + " strText: " +this.strText);

    
    //draw the label if bDisplayLabel is true
    if(bDisplayLabel){
      super.Draw();
    }
    
//    CLogger.Debug("[CTimer.Draw()] after Draw, timerSec:" + this.iTimerMSec+ " strText: " +this.strText);
  }
}

