/* --------------------------------------------------------------------------
 * This is main application program
 * @author:  Gigi Ho
 * date:  15/12/2012 (m/d/y)
 * ----------------------------------------------------------------------------
 */
 
//import testpackage.*;
//import tuio.*;

import java.util.*;
 
 
CPageController g_pageController = null; //this is a singleton
IInputController g_inputController = null; //@TODO: remove from global and passing to classes if necessary
CLightSource g_lightSource = null;
void setup(){
  size(640, 480); //size of the canvas
  background(0,0,0);
   
 // noLoop();
  g_pageController = new CPageController();
  g_pageController.GotoPageIdle();
  
  g_lightSource = new CLightSource();
   
   CLogger.Debug("test logger");
   
   //@TODO: define InputInterface here
   g_inputController = new CInputMouse();
   g_inputController.Init();
   
}
 
void draw() {
 
  g_pageController.curPage.Draw();
  
  
}

void mousePressed(){
  g_pageController.GotoPageCapture();
}
