/* --------------------------------------------------------------------------
 * This is CSystemInfoLabel class desc
 * author:  Gigi Ho
 * date:  15/12/2012
 * ----------------------------------------------------------------------------
 */
 
public class CSystemInfoLabel extends CLabel{
  CSystemInfoLabel(){
    super();
    
    this.iAlignX = RIGHT;
    this.iAlignY = BOTTOM;
  }

  
  boolean Init(){
    if(!super.Init()){
       return false; 
    }
    
    this.SetPosition(width,height);

    
    return true;
  }
  
  void Update(){
    super.Update();
    this.strText = "frameCount: " + frameCount + "\n"                
                   + "frameRate: " + nf(frameRate,2,2);
    
  }
  
  
  
}
