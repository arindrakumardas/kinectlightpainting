public class CInputKinect implements IInputController{
  CInputKinect(){
    
  }
  
  public boolean Init(){
    if (g_openNI.isInit() == false){
      CLogger.Error("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
      return false;
    }
    
    CLogger.Info("CInputKinect initializing.");
    g_openNI.setMirror(true); // mirror is by default enabled//
    g_openNI.enableDepth();  // enable depthMap generation 
    
    return true;
  }
  
  public float GetX(){
    return mouseX;
  }
  public float GetY(){
    return mouseY; 
  }
  
  public float GetLastX(){
    return pmouseX;
  }
  public float GetLastY(){
    return pmouseY;
  }
  
  
  
  
}
