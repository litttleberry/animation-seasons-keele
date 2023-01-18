/**
 * CSC-10026 Coursework b) Keele Interaction (60 %)
 *
 * A sketch of the Ladies of the Seasons consisting of six scenes:
 *  1 instructions / welcome page
 *  2-5 Ladies of the Seasons
 *  6 rolling credits
 *
 * @author litttleberry
 * @version 2.0 5.5.2022
 */

import processing.sound.*;

// Files used in the sketch
PImage bg, spring, summer, autumn, winter, squirrel, bird0, bird1, bird2;
String[] fortunes, forecasts, credits;
PFont txt, headings, subheadings;
SoundFile chill;

// Keele colours
int[] colours = { color(39, 30, 61), color(210, 53, 31), // 0 blue,  1 red
                  color(46, 167, 101), color(227, 200, 60), // 2 green, 3 yellow
                  color(255, 255, 255) };                    // 4 white

// Cherry tree
float angle = PI/6; // Angle between branches


/**
 * Setting up the scene. Display size, background colour, loading files.
 * Buttons for moving between scenes resized and set using translate.
 * Parsing user manual from file and displaying text on screen.
 * Variables for binary clock (used in winter()).
 */
void setup() {
  size(900, 750);
  background(colours[0]);

  bg = loadImage("keeleHall.png");
  spring = loadImage("spring.png");
  summer = loadImage("summer.png");
  autumn = loadImage("autumn.png");
  winter = loadImage("winter.png");
  squirrel = loadImage("squirrel.png");

  bird0 = loadImage("bird0.png");
  bird1 = loadImage("bird1.png");
  bird2 = loadImage("bird2.png");

  credits = loadStrings("cred.txt");
  txt = createFont("font_text.ttf", 20);
  textFont(txt);

  chill = new SoundFile(this, "chill.mp3");
  chill.loop();

  // BUTTONS
  push();
  translate(0, 600);
  int b = 150;
  image(squirrel, 0, 0, b, b);
  image(spring, 150, 0, b, b);
  image(summer, 300, 0, b, b);
  image(autumn, 450, 0, b, b);
  image(winter, 600, 0, b, b);
  pushMatrix();
  translate( 600 + squirrel.width, 0 );
  scale( -1, 1 );
  image(squirrel, 0, 0, b, b );
  popMatrix();
  pop();

  // INFO TEXT
  push();
  stroke(colours[3]);
  strokeWeight(5);
  fill(255);
  rect(100, 80, 700, 450, 38);
  String info = parseFromFile();
  fill(colours[0]);
  textSize(15);
  textAlign(CENTER, CENTER);
  text(info, 150, 80, 600, 450);
  pop();

  // BINARY CLOCK
  len = cols.length;
  w = (300 - 2 * margin) / len;
}


/**
 * Set of functions called from draw to ensure smooth transitions
 * between scenes and no unwanted stacking of background music.
 */
void initialise() {
  clear();
  setup();
  chill.stop();
}


/**
 * Parses text from a file onto display screen with line breaks.
 */
String parseFromFile() {
  StringBuilder sb = new StringBuilder();
  String line = null;
  BufferedReader fi = createReader("info.txt");
  try {
    while ( (line = fi.readLine()) != null ) {
      if (line.substring(0, 1).equals("*")) sb.append("\r\n");
      else sb.append(new String(line));
    }
    fi.close();
  }
  catch(IOException e) {
    e.getMessage();
  }
  return sb.toString();
}


/**
 * Animating the scenes.
 */
void draw() {
  noLoop();

  // INFORMATION
  if (mouseX > 0 && mouseX < 150) {
    if (mouseY > 600 && mouseY < height) {
      initialise();
    }
  }

  // SPRING
  if (mouseX > 150 && mouseX < 300) {
    if (mouseY > 600 && mouseY < height) {
      initialise();
      spring();
    }
  }

  // SUMMER
  if (mouseX > 300 && mouseX < 450) {
    if (mouseY > 600 && mouseY < height) {
      initialise();
      summer();
    }
  }

  // AUTUMN
  if (mouseX > 450 && mouseX < 600) {
    if (mouseY > 600 && mouseY < height) {
      initialise();
      loop();
      autumn();
    }
  }

  // WINTER
  if ((mouseX > 600 && mouseX < 750)) {
    if (mouseY > 600 && mouseY < height) {
      initialise();
      loop();
      winter();
    }
  }

  // CREDITS
  if (mouseX > 750 && mouseX < width ) {
    if (mouseY > 600 && mouseY < height) {
      clear();
      chill.stop();
      loop();
      credits();
    }
  }
}


/**
 * Function that observes if the mouse buttons have been
 * pressed and released to enable moving between scenes.
 */
void mouseClicked() {
  redraw();
}


/**
 * Basic form for cherry tree shown in each season.
 * Sets the trunk in place and calls branch function.
 *
 * param season   which season the function is called from
 */
void tree(String season) {
  translate(width/5*4, 550);
  strokeWeight(25);    // tree trunk
  stroke(105, 82, 70);
  line(0, 0, 0, -150);
  translate(0, -150);
  rotate(-0.4);        // rotates the lowest fork a smidge to the left
  branch(120, season);
}


/**
 * Method for creating a branch. Gets called recursively.
 * Created using recursion, translate, rotate, push and pop, random,
 * bezier curves, for-loops, and strokes thinning towards the ends.
 * Modified depending on season: blossoms, leaves, bare tree.
 *
 * param h   initial branch length
 * param s   which season function is called from
 */
void branch(float h, String s) {
  h *= 0.75; // branchlength = branchlength * r
  if (h >= 15) {

    // Right-hand branch
    pushMatrix();
    rotate(random(angle, angle*1.5));
    noFill();
    strokeWeight(h/8);
    bezier(0, 0, 0, -h, -h, -h/12, 0, -h);
    translate(0, -h);
    branch(h, s);
    popMatrix();

    // Left-hand branch
    pushMatrix();
    strokeWeight(h/6);
    rotate(-random(angle, angle*1.5));
    bezier(0, 0, 0, 0, -h/6, 0, 0, -h);
    translate(0, -h);
    branch(h, s);
    popMatrix();
  }

  // Sprintime blossoms
  else if (s == "spring") {
    push();
    noStroke();
    for (int i = 0; i <= 25; i++) {
      fill(random(200, 254), 80, 80);  // flowers in shades of red, pink, rose
      ellipse(random(-25, 25), random(-25, 25), 5, 5);
    }

    for (int i = 0; i <= 10; i++) {
      fill(255, random(220, 255), random(220, 255));  // flowers in shades of whites
      ellipse(random(-25, 25), random(-25, 25), 5, 5);
    }
    pop();
  }

  // Summertime leaves
  else if (s == "summer") {
    push();
    noStroke();

    for (int i = 0; i <= 45; i++) {
      fill(80, random(80, 255), 80);  // leaves in different shades of greens
      ellipse(random(-40, 60), random(-30, 30), 8, random(5, 15));
    }
    pop();
  }

  // Autumn leaves
  else if (s == "autumn") {
    push();
    noStroke();
    for (int i = 0; i <= 15; i++) {
      fill(random(200, 255), random(100, 255), 80);  // leaves in different shades of oranges, yellows, browns
      ellipse(random(-40, 60), random(-30, 30), 8, random(5, 15));
    }
    pop();
  }
}


/**
 * Method for displaying seasonal text input. Creates a box
 * to which input, such as fortunes and forecasts are printed.
 *
 * param s  printed text
 * param x  left (top) corner of text box
 * param y  (left) top corner of text box
 * param w  width of text box
 * param h  height of text box
 * param c  colour of border (index in colour[])
 */
void canvas(String s, int x, int y, int w, int h, int c) {

  push();
  stroke(colours[c]);
  strokeWeight(5);
  fill(255);
  rect(x, y, w, h, 38);
  fill(colours[0]);
  textSize(15);
  text(s, x+25, y+35, w-40, h-40);
  pop();
}
