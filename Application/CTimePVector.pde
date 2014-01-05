/* --------------------------------------------------------------------------
 * @author:  gigi
 * date:  4/1/2014 (m/d/y)
 * desc: this is a PVector with one more value, which is time
 * ----------------------------------------------------------------------------
 */

public class CTimePVector extends PVector{
  public int iTime = 0; //in ms
  
  CTimePVector(int iTimeMS, float x, float y){
   super(x,y);
   this.iTime = iTimeMS;
  }
  
  CTimePVector(int iTimeMS, PVector vecPos){
    super(vecPos.x, vecPos.y, vecPos.z);
    this.iTime = iTimeMS; 
  }
  
}
