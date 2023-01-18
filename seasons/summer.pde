/**
 * Scene: Summer
 * Lady of the Second Season gives the user a weather forecast.
 * Fractal cherry tree is loaded with leaves in different shades of green.
 * Serene background music continues playing.
 * Files used:
    forecasts.txt   A list of 8 idio(ma)tic weather forecasts.
    bg.png          Background image of Keele Hall
 */


/**
 * Setting up the summer scene. Loading of files, method calls.
 */
void summer() {
  image(bg, 0, 0);
  forecasts = loadStrings("forecasts.txt");
  String weather = forecasts[(int)random(forecasts.length)];
  canvas(weather, 100, 250, 200, 120, 3);  // 3 == yellow border
  tree("summer");
  noLoop();
}
