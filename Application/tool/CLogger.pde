/* --------------------------------------------------------------------------
 * This is logger class desc
 * author:  Gigi Ho
 * date:  15/12/2012
 * ----------------------------------------------------------------------------
 */
public static class CLogger{
  public static void Debug(String strLogMessage){
    System.out.println("[debug]" + strLogMessage);
  }
  
  public static void Info(String strLogMessage){
    System.out.println("[info]" + strLogMessage);
  }
  
  public static void Error(String strLogMessage){
    System.out.println("[error]" + strLogMessage);
  }
  
  
}
