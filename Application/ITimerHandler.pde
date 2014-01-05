/* --------------------------------------------------------------------------
 * ITimerHandler 
 * desc: any class who have used a CTimer and need a timer callback when time is up must implement this
 * author:  Gigi Ho
 * date:  15/12/2012 
 * ----------------------------------------------------------------------------
 */


public interface ITimerHandler{  
  public void TimeIsUp(int iTag);
  
  
}
