/* --------------------------------------------------------------------------
 * CScene 
 * author:  Gigi Ho
 * date:  15/12/2012 
 * ----------------------------------------------------------------------------
 */

class CScene extends CLayer{
  boolean bSystemInfoOn = true;
  
  CScene(){
    super();
  }
  
  boolean Init(){
    if(!super.Init()){
      return false;
    }
    
    CLogger.Debug("[CScene.Init()]");
    
    //FIXME: show as last
    if(this.bSystemInfoOn){
      CSystemInfoLabel sysLabel = new CSystemInfoLabel();
      sysLabel.Init();
      this.AddChild(sysLabel);  
    }
    
    return true;
  }
  
  void Draw(){
    
    background(0); //set background 0 to reset the scene bg all the time
    super.Draw();
  //  image(HandCalibration, width/2-30, HandCalibration.height / 2);
    
  }
  
}
