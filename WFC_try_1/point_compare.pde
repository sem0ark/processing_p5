void process_up(int point) {
  
  int[] m_texture = chosen_tile_texture(point);
  
  for (int t=0; t<tiles.length; t++) {
    boolean fg = true;
    
    for (int x=0; x<tileSize; x++) {
      for (int y=0; y<tileSize-1; y++) {
        fg = fg && (m_texture[tileSize*y+x] == tiles[t].texture[tileSize*(y-1)+x]);
      }
    }
    map[point][t] = fg && map[point][t];
  }
}

void process_down(int point) {
  int[] m_texture = chosen_tile_texture(point);
  
  for (int t=0; t<tiles.length; t++) {
    boolean fg = true;
    
    for (int x=0; x<tileSize; x++) {
      for (int y=1; y<tileSize; y++) {
        fg = fg && (m_texture[tileSize*y+x] == tiles[t].texture[tileSize*(y-1)+x]);
      }
    }
    map[point][t] = fg && map[point][t];
  }
}

void process_left(int point) {
  int[] m_texture = chosen_tile_texture(point);
  
  for (int t=0; t<tiles.length; t++) {
    boolean fg = true;
    
    for (int x=0; x<tileSize-1; x++) {
      for (int y=0; y<tileSize; y++) {
        fg = fg && (m_texture[tileSize*y+x] == tiles[t].texture[tileSize*y+x+1]);
      }
    }
    map[point][t] = fg && map[point][t];
  }
}

void process_right(int point) {
  int[] m_texture = chosen_tile_texture(point);
  
  for (int t=0; t<tiles.length; t++) {
    boolean fg = true;
    
    for (int x=1; x<tileSize; x++) {
      for (int y=0; y<tileSize; y++) {
        fg = fg && (m_texture[tileSize*y+x] == tiles[t].texture[tileSize*y+x-1]);
      }
    }
    map[point][t] = fg && map[point][t];
  }
}

int[] chosen_tile_texture(int cur_point) {
  int c = 0;
  for (int t=0; t<map[cur_point].length; t++) if (map[cur_point][t]) c=t;
  return tiles[c].texture;
}

boolean is_chosen(int cur_point) {
  int c = 0;
  for (int t=0; t<map[cur_point].length; t++) if (map[cur_point][t]) c++;
  return c==1;
}

boolean is_nondet(int cur_point) {
  int c = 0;
  for (int t=0; t<map[cur_point].length; t++) if (map[cur_point][t]) c++;
  return c==map[cur_point].length;
}
