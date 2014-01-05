public class CInputMouse implements IInputController{
  CInputMouse(){
    
  }
  
  public boolean Init(){
//    ArrayList<PVector> vecPosList = new ArrayList<PVector>();
//    PVector vecPos = new PVector(mouseX, mouseY);
//    vecPosList.add(0, vecPos);
// 
//    this.vecPathListMap.put(0, vecPosList); //always have only 1 cursor, which has id =0
    
    ArrayList<CTimePVector> tvecPosList = new ArrayList<CTimePVector>();
    CTimePVector tvecPos = new CTimePVector(millis() , mouseX, mouseY);
    tvecPosList.add(0, tvecPos);
 
    this.tvecPathListMap.put(0, tvecPosList); //always have only 1 cursor, which has id =0
    
    return true;
  }
  
  public void Update(){
    ArrayList<CTimePVector> tvecPosList = this.tvecPathListMap.get(0);
    if(tvecPosList == null){
      return;
    }
    CTimePVector tvecPos = new CTimePVector(millis(), mouseX, mouseY);
    tvecPosList.add(0, tvecPos);
    
    if(tvecPosList.size() > this.iPathListSize){
      //remove the last point
      tvecPosList.remove(tvecPosList.size()-1); 
      
    }
  }
  
  public Map<Integer,ArrayList<CTimePVector>> GetAllPath(){
    
    return this.tvecPathListMap;
  }
  
  public ArrayList<CTimePVector> GetPath(){
    return this.GetPath(0);
  }
  
  public ArrayList<CTimePVector> GetPath(int iInputId){
    ArrayList<CTimePVector> tvecPosList = this.tvecPathListMap.get(new Integer(iInputId));
    if(tvecPosList == null){
      return null;
    }
    
    return tvecPosList;
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
