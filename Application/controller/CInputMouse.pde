public class CInputMouse implements IInputInterface{
  CInputMouse(){
    
  }
  
  public boolean Init(){
    return true;
  }
  
  public float GetX(){
    return mouseX;
  }
  public float GetY(){
    return mouseX; 
  }
  
  public float GetLastX(){
    return pmouseX;
  }
  public float GetLastY(){
    return pmouseX;
  }
  
  
  
  
}
