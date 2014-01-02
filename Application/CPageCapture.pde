/* --------------------------------------------------------------------------
 * CPageCapture 
 * author:  Gigi Ho
 * date:  15/12/2012 
 * ----------------------------------------------------------------------------
 */

class CPageCapture extends CScene{
  CPageCapture(){
    super();
  }

  boolean Init(){
    if(!super.Init()){
      return false;
    }
    
    CLogger.Debug("[CPageCapture.Init]");
    
    //Init drawable components inside CLayer
    CLabel testLabel = new CLabel("This is PageCapture");  
    testLabel.fFontSize = 20;
    testLabel.SetPosition(width/2,20);
    this.AddChild(testLabel);
    
    return true;
  } 
}
