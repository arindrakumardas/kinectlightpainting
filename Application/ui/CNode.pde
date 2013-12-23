/* --------------------------------------------------------------------------
 * This is CNode class desc
 * author:  Gigi Ho
 * date:  15/12/2012
 * ----------------------------------------------------------------------------
 */
 
class CNode {
  protected CPoint cptPosition = null;
  
  CNode(){ 
  }
  
  boolean Init(){
    return true;
  }
  
  /**
   * @desc this will be called in Draw(), used for var update before drawing objects
 
   */ 
  void Update(){
    
  }
  
  void SetPosition(float fPosX, float fPosY){
    if(this.cptPosition == null){
      this.cptPosition = new CPoint(fPosX, fPosY);
      return;
    }
    
    this.cptPosition.SetXY(fPosX, fPosY);
  }
  
  CPoint GetPosition(){
    return this.cptPosition;
  }
  
  float GetPositionX(){
//    if(!this.cptPosition){
      //throw exception
//    }
    
    return this.cptPosition.GetX();
  }
  
  float GetPositionY(){
    return this.cptPosition.GetY();
  }
  
  float GetPositionZ(){
    return this.cptPosition.GetZ();
  }
   
}
 
