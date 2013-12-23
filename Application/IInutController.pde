public interface IInputController{
  public boolean bIsOn = true;
  public enum eType{
    eMOUSE,
    eKINECT
  };

  public boolean Init();  
  
  public float GetX();
  public float GetY();
  
  public float GetLastX();
  public float GetLastY();
  
  
}
