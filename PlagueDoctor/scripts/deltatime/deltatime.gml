//Delta time
globalvar delta;
delta = 0;

//This doesn't really matter what it is, but will affect rate of everything. 
//Just needs some constant to measure against
#macro defaultFramesPerSecond 60
global.framesPerSecond = 144;


//Time that a single frame should last by default
global.targetDelta = 1 / defaultFramesPerSecond;

//Actual time that includes lag etc.
global.actualDelta = delta_time / 1000000;

//This is going to be used EVERYWHERE, so having a shorter name is convenient
//Don't use this way of creating global variables otherwise
globalvar delta;
delta = global.actualDelta / global.targetDelta;

global.timeScale = 1;
global.paused = false;
global.pausedTime = 0;