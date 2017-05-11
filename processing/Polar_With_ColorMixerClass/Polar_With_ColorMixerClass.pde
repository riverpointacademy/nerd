int radius = 20;
float diameter = 2*radius;
float xPos;
float yPos;
float theta = 0;
int dotController = 100;
float increment = PI/dotController;
float r;
color blue = #42548d;
int function = 1;
float a = 0.6;
color temp;

color[] pastels = {
 // color(246, 235, 170), 
  color(194, 86, 119), 
  color(199, 122, 159), 
  color(178, 116, 158), 
  color(157, 111, 156), 
  color(139, 108, 155), 
  color(125, 110, 160), 
  color(117, 114, 163), 
  color(81, 90, 157), 
  color(118, 145, 199), 
  color(101, 174, 208), 
  color(92, 153, 169), 
  color(99, 172, 171), 
  color(100, 170, 154), 
  color(105, 166, 142), 
  color(106, 166, 130)
};

// This is an object of my ColorMixer class (see Class definition at bottom for details). 
ColorMixer myMixer = new ColorMixer(pastels);  


void setup()
{
  size(350, 350);
  background(255);
  frameRate(120);
}

void draw()
{
 //background(myMixer.mixColors(0.1));
  r = 140*sin(-a*theta);

  translate(width/2, height/2);
  theta += increment;
  xPos = r * cos(theta);
  yPos = r * sin(theta);
  fill(myMixer.mixColors(0.1)); // this mixes the colors.
  noStroke();
  ellipse(xPos, yPos, 6, 6);
  point(xPos, yPos);
}

void mousePressed()
{
  background(255);
  a += .2;
  if (a==1) a += .2;
}