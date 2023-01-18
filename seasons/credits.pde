/**
 * Scene: Rolling credits
 * Rolling credits pulled from a text file and printed on screen row by row.
 * Serene background music continues playing.
 * Files used:
    cred.txt    Credits
 */

String line;
int rowH = 25;

void credits() {
  push();
  background(colours[0]);
  frameRate(600);

  textAlign(CENTER, CENTER);
  headings = createFont("font_night.ttf", 40);
  subheadings = createFont("font_matcha.ttf", 30);
  fill(255);
  
  for (int i = 0; i < credits.length; i++) {
    line = credits[i];
    if (!line.isEmpty() && line.charAt(0) == '*') {
      line = line.substring(1);
      textFont(headings);
      text(line, width/2, height - rowH - frameCount + rowH*i);
    } else if (!line.isEmpty() && line.charAt(0) =='?') {
      line = line.substring(1);
      textFont(subheadings);
      text(line, width/2, height - rowH - frameCount + rowH*i);
    } else {
      textFont(txt);
      text(line, width/2, height - rowH - frameCount + rowH*i);
    }
  }
  pop();
}
