void keyReleased() {
  
  switch (key) {
    case ' ':
      fps = tfps - fps;
      frameRate(fps+1);
      break;
    case '1':
      saveRule("1");
      break;
    case '2':
      saveRule("2");
      break;
    case '3':
      saveRule("3");
      break;
    case '4':
      saveRule("4");
      break;
  }
  
  switch (keyCode) {
    case SHIFT:
      saveFile();
      exit();
  }
}
