/**
 * Scene: Spring
 * Lady of the First Season gives the user a random good fortune on each click.
 * Fractal cherry tree is in bloom. Serene background music continues playing.
 * Files used:
     fortunes.txt   A list of 14 good fortunes
     bg.png         Background image of Keele Hall
 */
 

/**
 * Setting up the spring scene. Loading of files, method calls.
 */
void spring() {
  image(bg, 0, 0);
  fortunes = loadStrings("fortunes.txt");
  String line = fortunes[(int)random(fortunes.length)];
  canvas(line, 100, 150, 200, 300, 2); // 2 = green border
  tree("spring");
  noLoop();
}
