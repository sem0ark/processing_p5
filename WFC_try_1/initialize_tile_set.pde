class Tile implements Comparable<Tile> {
  int[] texture;
  int size;
  
  Tile(int size) {
    this.texture = new int[size*size];
    this.size = size;
  }
  
  @Override
  public int compareTo(Tile o) {
    for (int i=0; i<this.texture.length; i++) {
      if (this.texture[i] > o.texture[i]) return 1;
      else if (this.texture[i] < o.texture[i]) return -1;
    }
    return 0;
  }
}

int[] rotate_texture(int[] arr, int size) {
  int[] t = new int[arr.length];
  
  for (int x=0; x<size; x++) {
    for (int y=0; y<size; y++) {
      t[size*y+x] = arr[size*x+size-y-1];
    }
  }
  return t;
}

int[] mirror_x_texture(int[] arr, int size) {
  int[] t = new int[arr.length];
  
  for (int x=0; x<size; x++) {
    for (int y=0; y<size; y++) {
      t[size*y+x] = arr[size*(size-y-1)+x];
    }
  }
  return t;
}

int[] mirror_y_texture(int[] arr, int size) {
  int[] t = new int[arr.length];
  
  for (int x=0; x<size; x++) {
    for (int y=0; y<size; y++) {
      t[size*y+x] = arr[size*y+size-x-1];
    }
  }
  return t;
}

int[] mirror_xy_texture(int[] arr, int size) {
  int[] t = new int[arr.length];
  
  for (int x=0; x<size; x++) {
    for (int y=0; y<size; y++) {
      t[size*y+x] = arr[size*x+y];
    }
  }
  return t;
}

int[] mirror_yx_texture(int[] arr, int size) {
  int[] t = new int[arr.length];
  
  for (int x=0; x<size; x++) {
    for (int y=0; y<size; y++) {
      t[size*y+x] = arr[size*(size-x-1)+size-y-1];
    }
  }
  return t;
}


Tile[] initializeTiles(String file_name, int tile_size) {
  List<Tile> tileSet = new ArrayList();
  
  PImage input_file = loadImage(file_name);
  input_file.loadPixels();
  int h=input_file.height, w=input_file.width;
  
  int[] tex =new int[tile_size*tile_size];
  
  // view all start points
  for (int sy=0; sy<h-tile_size+1; sy++) {
    for (int sx=0; sx<w-tile_size+1; sx++) {
      // get pixels of every tile
      for (int y=0; y<tile_size; y++) {
        for (int x=0; x<tile_size; x++) {
          int pix = input_file.pixels[h*(sy+y)+sx+x];
          tex[tile_size*y+x] = pix;
        }
      }
      
      Tile tile = new Tile(tile_size);
      tile.texture = tex.clone();
      tileSet.add(tile);
      
      //tex = rotate_texture(tex, tile_size);
      //tile = new Tile(tile_size);
      //tile.texture = tex.clone();
      //tileSet.add(tile);
      
      //tex = rotate_texture(tex, tile_size);
      //tile = new Tile(tile_size);
      //tile.texture = tex.clone();
      //tileSet.add(tile);
      
      //tex = rotate_texture(tex, tile_size);
      //tile = new Tile(tile_size);
      //tile.texture = tex.clone();
      //tileSet.add(tile);
      
      //tex = rotate_texture(tex, tile_size);
      
      //tile = new Tile(tile_size);
      //tile.texture = mirror_x_texture(tex, tile_size);
      //tileSet.add(tile);
      
      //tile = new Tile(tile_size);
      //tile.texture = mirror_y_texture(tex, tile_size);
      //tileSet.add(tile);
      
      //tile = new Tile(tile_size);
      //tile.texture = mirror_xy_texture(tex, tile_size);
      //tileSet.add(tile);
      
      //tile = new Tile(tile_size);
      //tile.texture = mirror_yx_texture(tex, tile_size);
      //tileSet.add(tile);
      
    }
  }
  
  tileSet.sort(new Comparator<Tile>(){
    @Override
    public int compare(Tile o1, Tile o2) {
        return o1.compareTo(o2);
    }
  });
  
  int i=0;
  while (i<tileSet.size()-1) {
    if (tileSet.get(i).compareTo(tileSet.get(i+1)) == 0) {
      tileSet.remove(i+1);
    } else i++;
  }
  
  Tile[] tiles = new Tile[tileSet.size()];
  i = 0;
  for(Tile tile: tileSet) {
    tiles[i++] = tile;
  }
  
  return tiles;
}
