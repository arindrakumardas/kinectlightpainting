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
import ddf.minim.*;


CPageController g_pageController = null; //this is a singleton
CInputManager g_inputManager = null; //this is a singleton


// For sound
AudioPlayer CameraShutterSound;
AudioPlayer CameraFocusSound;
AudioPlayer CameraBeepSound;
AudioPlayer ClickSound;
Minim minim;//audio context


//SegoeUI Font 
PFont SegoeUIFont;

void setup() {
  size(Configs.SKETCH_WIDTH, Configs.SKETCH_HEIGHT); //size of the sketch 
  background(0, 0, 0);
  
  //Sound
  minim = new Minim(this);
  CameraShutterSound = minim.loadFile("CameraShutterSound.mp3");
  CameraBeepSound = minim.loadFile("BeepSound.mp3");
  CameraFocusSound = minim.loadFile("CameraFocusSound.mp3");
  ClickSound = minim.loadFile("ClickSound.mp3");

  //Animation
//  HandCalibration = new Gif(this, "giphy.gif");
//  HandCalibration.loop();

  //Font
  
  SegoeUIFont = loadFont("SegoeUI-Bold-48.vlw");
  

  //Init PageController
  g_pageController = new CPageController();


  // Init InputManager
  g_inputManager = new CInputManager();
  g_inputManager.Init(this);


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
