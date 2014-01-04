/* --------------------------------------------------------------------------
 * This is main application program
 * @author:  Gigi Ho
 * date:  15/12/2012 (m/d/y)
 * ----------------------------------------------------------------------------
 */
 
//import testpackage.*;
//import tuio.*;


import SimpleOpenNI.*;
import java.util.*;
import controlP5.*;

 
 
CPageController g_pageController = null; //this is a singleton
IInputController g_inputController = null; //@TODO: remove from global and passing to classes if necessary

//@attn: vishnu
//@from: gigi
//light Source can be more than 1, it should not be global
//CLightSource g_lightSource = null;
ControlP5 g_cp5Controller = null;

SimpleOpenNI g_kinect = null;

void setup(){
  size(640, 480); //size of the sketch
  background(0,0,0);
   
  //Init PageController
  g_pageController = new CPageController();

//  g_lightSource = new CLightSource();
  
  // Init InputController
  g_kinect = new SimpleOpenNI(this);
  if (g_kinect.isInit() == true)
  {
    g_inputController = new CInputKinect();
    CLogger.Info("InputController : InputKinect");
  }else{
    g_inputController = new CInputMouse();
    CLogger.Info("InputController : InputMouse");
  }
  g_inputController.Init();
   
  // Init CP5 GUI controller
  g_cp5Controller = new ControlP5(this);
  
  // GO TO THE first default page 
  g_pageController.GotoPageIdle();
}
 
void draw() {
  g_inputController.Update();
  g_inputController.DrawCursor();
  g_pageController.curPage.Draw();
  
  
}

// -----------------------------------------------------------------
// Processing default mouse callbacks
// -----------------------------------------------------------------
void mousePressed(){
  if(g_inputController instanceof CInputMouse){ 
    ((CInputMouse)g_inputController).MousePressed();
  }
}

void mouseMoved(){
  if(g_inputController instanceof CInputMouse){ 
    ((CInputMouse)g_inputController).MouseMoved();
  }
}


// -----------------------------------------------------------------
// CP5 Control event callbacks (required by CP5)
// -----------------------------------------------------------------
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


// -----------------------------------------------------------------
// SImpleOpenNI callbacks
// -----------------------------------------------------------------
// hand events

void onNewHand(SimpleOpenNI curContext,int handId,PVector pos)
{
  ((CInputKinect) g_inputController).OnNewHand(curContext, handId, pos);
}

void onTrackedHand(SimpleOpenNI curContext,int handId, PVector pos)
{
  ((CInputKinect) g_inputController).OnTrackedHand(curContext, handId, pos);
}

void onLostHand(SimpleOpenNI curContext,int handId)
{
  ((CInputKinect) g_inputController).OnLostHand(curContext, handId);
}

// -----------------------------------------------------------------
// gesture events

void onCompletedGesture(SimpleOpenNI curContext,int gestureType, PVector pos)
{
  ((CInputKinect) g_inputController).OnCompletedGesture(curContext, gestureType, pos);
}
