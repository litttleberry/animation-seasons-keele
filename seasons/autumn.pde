/** //<>//
 * Scene: Autumn
 * Lady of the Third Season sees the birds fly south as winter nears.
 * Fractal cherry tree is crowned with leaves of reds, oranges, browns.
 * Serene background music continues playing.
 * Files used:
     bird0, bird1, bird2.png   Images of birds
     bg.png                    Background image of Keele Hall
 */

// Dimensions for bird imagery
float bw = 120;
float bh = 80;

/**
 * Setting up the autumn scene. Frame rate, loading of files, method calls.
 */
void autumn() {
  frameRate(5);
  image(bg, 0, 0);
  birds();
  tree("autumn");
}


/**
 * Method for three birds to appear to fly away and eventually disappear.
 */
void birds() {
  if (bw >= 10) {
    image(bird0, 300, 40, bw -= 1, bh -= 1);
    image(bird1, 650, 15, bw -= 1, bh -= 1);
    image(bird2, 70, 100, bw -= 1, bh -= 1);
  }
}
