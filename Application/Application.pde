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
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import gifAnimation.*;


CPageController g_pageController = null; //this is a singleton
//IInputController g_inputController = null; //@TODO: remove from global and passing to classes if necessary
CInputManager g_inputManager = null; //this is a singleton

//@attn: vishnu
//@from: gigi
//light Source can be more than 1, it should not be global
//CLightSource g_lightSource = null;
ControlP5 g_cp5Controller = null;


// For sound
AudioPlayer CameraShutterSound;
AudioPlayer CameraFocusSound;
AudioPlayer CameraBeepSound;
Minim minim;//audio context

//For animation
PImage[] animation;
Gif HandCalibration;
boolean pause = false;

//SegoeUI Font 
PFont SegoeUIFont;

void setup() {
  size(640, 480); //size of the sketch
  background(0, 0, 0);
  
  //Sound
  minim = new Minim(this);
  CameraShutterSound = minim.loadFile("CameraShutterSound.mp3");
  CameraBeepSound = minim.loadFile("BeepSound.mp3");
  CameraFocusSound = minim.loadFile("CameraFocusSound.mp3");

  //Animation
  HandCalibration = new Gif(this, "giphy.gif");
  HandCalibration.loop();

  //Font
  
  SegoeUIFont = loadFont("SegoeUI-Bold-48.vlw");
  

  //Init PageController
  g_pageController = new CPageController();


  // Init InputManager
  g_inputManager = new CInputManager();
  g_inputManager.Init(this);


    // Init CP5 GUI controller
  g_cp5Controller = new ControlP5(this);

  // GO TO THE first default page 
  g_pageController.GotoPageIdle();
}

void draw() {
  g_inputManager.Update();
  g_pageController.curPage.Draw();
}

// -----------------------------------------------------------------
// Processing default mouse callbacks
// -----------------------------------------------------------------
void mousePressed() {
  //forward mouse event to InputManager
  g_inputManager.MousePressed();
  
}

void mouseMoved() {
   //forward mouse event to InputManager
  g_inputManager.MouseMoved();
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

void onNewHand(SimpleOpenNI curContext, int handId, PVector pos)
{
  g_inputManager.OnNewHand(curContext, handId, pos);
  
}

void onTrackedHand(SimpleOpenNI curContext, int handId, PVector pos)
{
  g_inputManager.OnTrackedHand(curContext, handId, pos);
}

void onLostHand(SimpleOpenNI curContext, int handId)
{
  g_inputManager.OnLostHand(curContext, handId);
}

// -----------------------------------------------------------------
// gesture events

void onCompletedGesture(SimpleOpenNI curContext, int gestureType, PVector pos)
{
  g_inputManager.OnCompletedGesture(curContext, gestureType, pos);
}
