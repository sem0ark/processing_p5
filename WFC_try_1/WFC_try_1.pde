import java.util.ArrayList;
import java.util.Stack;
import java.util.List;
import java.util.Comparator;
import java.util.Arrays;
import java.lang.Comparable;

int mapX = 50;
int mapY = 50;
int tileSize = 3;
Tile[] tiles;
boolean[][] map;


//
// DON'T WORK
//


void setup() {
  size(100, 100);
  m();
}

void draw() {

}


void init() {
  tiles = initializeTiles("test_1.png", tileSize); // init tiles
  map = new boolean[mapY*mapX][tiles.length]; // init map
  for (int i=0; i<map.length; i++) {
    for (int t=0; i<map[i].length; i++) {
      map[i][t] = true;
    }
  }
}


void m() {
  init();
  
  // choose random point and tile to start
  int start_coor = int(random(0,(mapY-tileSize)*mapX-tileSize+1));
  int start_tile = int(random(tiles.length));
  
  int cur_point = start_coor;
  int cur_tile  = start_tile;
  
  
  int[] cur_pair;
  
  //for (int i=0; i<tiles.length; i++) {
  //  PImage img = createImage(tileSize, tileSize, RGB);
  //  img.loadPixels();
    
  //  for (int p=0; p<tiles[i].texture.length; p++) {
  //    println(red(tiles[i].texture[p]), green(tiles[i].texture[p]), blue(tiles[i].texture[p]));
  //    img.pixels[p] = tiles[i].texture[p];
  //  }
  //  img.updatePixels();
  //  image(img, (tileSize+1)*i % width, int((tileSize+1)*i / height)*(tileSize+1));
  //}
  
  redraw();
  boolean run = true;
  //main loop
  while (run) {
    process_point(cur_point, cur_tile);
    propagate_points(cur_point);
    cur_pair = choose_point();
    cur_point = cur_pair[0];
    cur_tile  = cur_pair[1];
    
    run = (cur_point != -1);
  }
  
  println("hello");
  draw_map();
  
}

void process_point(int cur_point, int cur_tile) {
  for (int i=0; i<tiles.length; i++) {
    map[cur_point][i] = false;
  }
  map[cur_point][cur_tile] = true;
}

void propagate_points(int point) {
  Stack<Integer> stack = new Stack();
  
  stack.push(point);
  
  while (!stack.empty()) {    
    point = stack.pop();
    if (!is_chosen(point)) {
      int x = point % mapX;
      int y = point / mapX;
      int coor;
      process_up(point);
      process_down(point);
      process_right(point);
      process_left(point);
      
      coor = point-mapX+map.length;
      if (coor >= map.length) coor -= map.length;
      if (!is_nondet(coor)) stack.push(coor);
      
      coor = point+mapX+map.length;
      if (coor >= map.length) coor -= map.length;
      if (!is_nondet(coor)) stack.push(coor);
      
      coor = point-1+map.length;
      if (coor >= map.length) coor -= map.length;
      if (!is_nondet(coor)) stack.push(coor);
      
      coor = point+1+map.length;
      if (coor >= map.length) coor -= map.length;
      if (!is_nondet(coor)) stack.push(coor);
    }
  }
}


int[] choose_point() {
  int[] res = new int[2];
  List<Integer> best_points = new ArrayList();
  int min_lim = tiles.length;
  int c;
  for (int i=0; i<map.length; i++) {
    c = 0;
    for (int t=0; t<map[i].length; t++) {
      if (!map[i][t]) c++;
    }
    if (c == min_lim) best_points.add(i);
    else if (c < min_lim && c > 1) {
      best_points.clear();
      min_lim = c;
      best_points.add(i);
    }
  }
  
  if (best_points.size() > 0) res[0] = best_points.get(int(random(0, best_points.size())));
  else {
    res[0] = -1;
    return res;
  }
  
  best_points.clear();
  for (int t=0; t<map[res[0]].length; t++) {
    if (!map[0][t]) best_points.add(t);
  }
  res[1] = best_points.get(int(random(0, best_points.size())));
  
  return res;
}

int get_color(int point) {
  int c = 0;
  int sum_r = 0;
  int sum_g = 0;
  int sum_b = 0;
  for (int t=0; t<map[point].length; t++) {
    if (!map[point][t]) {
      c++;
      sum_r = int(red(tiles[t].texture[0]));
      sum_g = int(green(tiles[t].texture[0]));
      sum_b = int(blue(tiles[t].texture[0]));
    }
  }
  
  return color(sum_r/c, sum_g/c, sum_b/c);
}

void draw_map() {
  PImage img = createImage(mapX, mapY, RGB);
  img.loadPixels();
  for (int i=0; i<map.length; i++) {
    img.pixels[i] = get_color(i);
  }
  img.updatePixels();
  image(img, 0, 0);
}
