/**
 * Scene: Winter
 * Lady of the Fourth Season tells the user the time in binary and text just to be safe.
 * Fractal cherry tree is bare. Serene background music continues playing.
 * Files used:
     bg.png   Background image of Keele Hall
 */

// Variables for binary clock.
int cols[] = { 2, 4, 3, 4, 3, 4 };  // h h m m s s
int len;
int index = 0;
float w;
float margin = 50;
float padding = 5;


/**
 * Setting up the winter scene. Printing of time in plaintext, method calls.
 */
void winter() {
  frameRate(1);
  image(bg, 0, 0);
  String plainTime = "Current time is " + nf(hour(), 2) + ":" + nf(minute(), 2) + ":" + nf(second(), 2) + ".";
  canvas(plainTime, 100, 250, 300, 300, 1); // 1 = red border
  clock();
  tree("winter");
}


/**
 * Binary clock. Setting up hours, minutes and seconds to show as white or
 * red circles. Code heavily influenced by V. Lukashevics' code for binary clock,
 * https://github.com/vlukashevich/binary-clock-processing/blob/master/binary_clock.pde
 */
void clock() {
  push();
  noStroke();
  String time = getTime();

  for (int i = 0; i < len; i++) {
    float x = margin + w * (i + 3.5);
    char c = time.charAt(i);
    String s = Integer.toString(c, 2);
    s = new StringBuilder(s).reverse().toString();

    for (int j = 0; j < cols[i]; j++) {
      float y = height - (margin + w * (j + 7));
      float d = w - padding;

      if ( s.charAt(j) == '1' ) {
        noStroke();
        fill(colours[1]);
      } else {
        strokeWeight(2);
        stroke(colours[0]);
        noFill();
      }
      circle(x, y, d);
    }
  }
  pop();
}


/**
 * A function to get current time from system.
 */
String getTime() {
  int hour = hour();
  String h = (hour > 9) ? Integer.toString(hour) : "0" + Integer.toString(hour);

  int minute = minute();
  String m = (minute > 9) ? Integer.toString(minute) : "0" + Integer.toString(minute);

  int second = second();
  String s = (second > 9) ? Integer.toString(second) : "0" + Integer.toString(second);

  return h + m + s;
}
