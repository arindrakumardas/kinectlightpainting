public interface IInputController{
  //TODO: remember more than 2 points, use a vector list to store the path (size of the list means how long the trail will be)
  
  public boolean bIsOn = true;

  public boolean Init();  
  public void Update();
  
  // TODO: support more than 1 input
  public float GetX();
  public float GetY();
  
  public float GetLastX();
  public float GetLastY();
  
  
}
