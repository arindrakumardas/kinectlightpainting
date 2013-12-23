public class CInputMouse implements IInputController{
  CInputMouse(){
    
  }
  
  public boolean Init(){
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
