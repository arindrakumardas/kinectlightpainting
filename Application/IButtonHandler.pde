/* --------------------------------------------------------------------------
 * IButtonHandler 
 * desc: any class who have used a CButton and need a button callback on any input event must implement this
 * author:  Gigi Ho
 * date:  15/12/2012 
 * ----------------------------------------------------------------------------
 */


public interface IButtonHandler{  
//  public void OnButtonOver();
  public void OnButtonSelected(int iBtnTag); //click by mouse or stay for 2 sec by kinect cursor
  
  
  
}
