public interface IInputController{
  //TODO: remember more than 2 points, use a vector list to store the path (size of the list means how long the trail will be)
  int iPathListSize = 20; //this determine how long the path will be 
  
  Map<Integer,ArrayList<CTimePVector>> tvecPathListMap = new HashMap<Integer,ArrayList<CTimePVector>>(); //key: Input id (id of hands / mouse cursor); value: path list 
  
  public boolean bIsOn = true;

  public boolean Init();  
  public void Update();
  
  public ArrayList<CTimePVector> GetPath(int iInputId);
  public Map<Integer,ArrayList<CTimePVector>> GetAllPath();
  
  public float GetX();
  public float GetY();
  
  public float GetLastX();
  public float GetLastY();
  
  public void DrawCursor(); //this will draw a cursor on the input
  
  
}
