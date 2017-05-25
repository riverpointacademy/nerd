import processing.sound.*;

SoundFile tones;
int timeLimit = 6000;
int index = 0;
float[] aVals = {0.2,0.4,0.5,0.6,1.4,1.5,2,3,5,9,11};  

void setup()
{
  //tones = new SoundFile(this,"edm.mp3");
  //tones = new SoundFile(this,"houseOrgan.mp3");
  //tones = new SoundFile(this,"massiveSaws.mp3");
  tones = new SoundFile(this,"strings.mp3");
  
  fullScreen();
  background(246);
  ellipseMode(CENTER);
  //size(1024, 768);
  noStroke();
  frameRate(100);
  myGraph.calculateValuePairs(aVals[0]);
  
  
}

void draw()
{
  // check to see if timeLimit has passed, 
  // if it has then switch to next "a" value in aVals[]
  if(millis() > timeLimit ) {
    timeLimit += 8000;
    index++;
    if(index > aVals.length-1) {
     index = 0;
    }
    myGraph.calculateValuePairs(aVals[index]);  // recalculate all values on new curve
  }
  
  numPairs = myGraph.valuePairsSize(); // keep track of how many coordinate pairs their are for error checking
 
  background(246);
  
  // loop through dots and draw them based on if they should be moving or not...
  for (int i = 0; i< dots.size(); i++ ) {
    cDot = dots.get(i); // keep track of the current dot
    if(moving) { // if mouse is clicked ******************** CHANGE THIS TO REFLECT TWO BUTTONS PRESSED **********************************
      if(numPairs > i) { //error checking
        float[] t =  myGraph.getValuePair(i);
        tempX = t[0];
        tempY = t[1];
        
        // make new target for each dot to arrive at
        PVector preAllocPolar = new PVector(tempX,tempY);
        cDot.arrive(preAllocPolar);
      }

    } else { // if not moving, send all dots back to their original positions...
     PVector home = new PVector(cDot.x(),cDot.y());
     cDot.arrive(home);
    }
    // draw update their positions and draw them to the screen
    cDot.update();
    cDot.display();
    myGraph.update();
  }  // end of dots loop
 
  // Check to see if dots are alive.  Remove the dead ones.
  Iterator<Dot> it = dots.iterator();
  while (it.hasNext()) {
    Dot p = it.next();
    p.update();
    if (p.isDead()) {
      it.remove();
    }
  }
  // debugging
  println("Items: "+dots.size()+" Millis: "+timeLimit+ " index: "+index+ " a-value: "+aVals[index]);
}

void mousePressed() {
  moving = !moving; 
 
}

void keyPressed()
{
  if (key == 'a') { // 1 dot
    dots.add(new Dot(random(width), random(height), random(10, 50), myMixer.mixColors(mix)));
    tones.rate(1.125);
    tones.play();
  } else if (key == 'b') { // 2 dots
      tones.rate(1.25);
      tones.play();
      for (int i = 0; i<2; i++) {
        dots.add(new Dot(random(width), random(height), random(10, 50), myMixer.mixColors(mix)));
      }
  } else if (key == 'c') { // 3 dots
      tones.rate(1.375);
      tones.play();
      for (int i = 0; i<3; i++) {
        dots.add(new Dot(random(width), random(height), random(10, 50), myMixer.mixColors(mix)));
      }
  } else if (key == 'd') { // 4 dots
      tones.rate(1.5);
      tones.play();
      for (int i = 0; i<4; i++) {
        dots.add(new Dot(random(width), random(height), random(10, 50), myMixer.mixColors(mix)));
       
      }
  } else if (key == 'e') { // 5 dots
      tones.rate(1.625);
      tones.play();
      for (int i = 0; i<5; i++) {
        dots.add(new Dot(random(width), random(height), random(10, 50), myMixer.mixColors(mix)));
      }
  } else if (key == 'f') { // 6 dots
      tones.rate(1.75);
      tones.play();
      for (int i = 0; i<6; i++) {
        dots.add(new Dot(random(width), random(height), random(10, 50), myMixer.mixColors(mix)));
      } 
  } else if (key == 'g') { // 10 dots
      tones.rate(1.875);
      tones.play();
      for (int i = 0; i<10; i++) {
        dots.add(new Dot(random(width), random(height), random(10, 50), myMixer.mixColors(mix)));
      }
  } 

} // end keyPressed()