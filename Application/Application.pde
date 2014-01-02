/* --------------------------------------------------------------------------
 * This is main application program
 * @author:  Gigi Ho
 * date:  15/12/2012 (m/d/y)
 * ----------------------------------------------------------------------------
 */
 
//import testpackage.*;
//import tuio.*;

import java.util.*;
import controlP5.*;

 
 
CPageController g_pageController = null; //this is a singleton
IInputController g_inputController = null; //@TODO: remove from global and passing to classes if necessary
CLightSource g_lightSource = null;
ControlP5 g_cp5Controller;

void setup(){
  size(640, 480); //size of the canvas
  background(0,0,0);
   
  //Init all controllers or global vars here
 // noLoop();
  g_pageController = new CPageController();

  g_lightSource = new CLightSource();
   
   
   //@TODO: define InputInterface here
  g_inputController = new CInputMouse();
  g_inputController.Init();
   
  g_cp5Controller = new ControlP5(this);
  
  // GO TO THE first default page 
  g_pageController.GotoPageIdle();
}
 
void draw() {
 
  g_pageController.curPage.Draw();
  
  
}

void mousePressed(){
//  g_pageController.GotoPageCapture();
}

// CP5 Control event controllers (required by CP5)
public void controlEvent(ControlEvent theEvent) {
  g_pageController.curPage.ControlEventHandler(theEvent);
//  n = 0;
}

//// function colorA will receive changes from 
//// controller with name colorA
//public void StartBtn(int theValue) {
//  println("a button event from colorA: "+theValue);
////  c1 = c2;
////  c2 = color(0,160,100);
//}
