public class CInputMouse extends CInputControllerBase{
  public static final int iDefaultInputId = 0; //always 0 because only 1 mouse
  
  CInputMouse(){
    super();
    
  }
  
  public boolean Init(){
    if(!super.Init()){
      return false;
    }
    
    CTimePVector tvecPos = new CTimePVector(millis() , mouseX, mouseY);
    this.tvecPathList.add(0, tvecPos);
 
    
    return true;
  }
  
  public void Update(){

      CTimePVector tvecPos = new CTimePVector(millis(), mouseX, mouseY);
      this.AddToList(0, tvecPos); //add the lastest pos to front
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
  
  public void DrawCursor(){
    
  }
  
  public void MousePressed(){
  
  }

  public void MouseMoved(){

  }
  
  
  
  
}
