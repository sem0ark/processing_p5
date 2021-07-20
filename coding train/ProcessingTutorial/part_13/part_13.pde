// Processing Tutorial #13

class Part_13 {
  
  // video 1
  void n1() {
    PFont f = createFont("Georgia", 64);
    String s = "To be or not to be.";
    textSize(64);
    textFont(f);
    text(s, 10, 100);
  }
  
  void n2() {
    PFont f = createFont("Georgia", 64);
    String s = "To be or not to be.";
    textSize(64);
    textFont(f);
    
    float x = 10;
    for (int i=0; i<s.length(); i++){
      textSize(random(30, 70));
      fill(random(125, 255));
      char c = s.charAt(i);
      text(c, x, 300);
      x += textWidth(c);
    }
  }
  
  //video 2
  void n3() {
    String s1 = "2,12,4,14,1,123";
    String[] nums1 = split(s1, ',');
    println(nums1);
    
    String s2 = "2,12,4, 14 ,   1 , 123";
    String[] nums2 = splitTokens(s2, ", ");
    println(nums2);
  }
  
  void n4() {
    String s = "100,90,32,7,87";
    String[] nums = split(s, ",");
    int[] vals = int(nums);
    
    for (int i=0; i < nums.length; i++) {
      ellipse(30 + i*50, 200, vals[i], vals[i]);
    }
  }
  
  void n5() {
    PFont f = createFont("Georgia", 64);
    textSize(64);
    textFont(f);
    
    String s = "To be or not to be.";
    String[] words = split(s, ' ');
    for (int i=0; i < words.length; i++) {
      text(words[i], 10, 48+i*48);
    }
  }
  
  // video 3
  void n6() {
    String[] words = loadStrings("hamlet.txt");
    String entireplay = join(words, " ");
    words = splitTokens(entireplay, " ,!?.;:");
  }
  
  // video 4
  void n7() {
    String[] words = loadStrings("hamlet.txt");
    String entireplay = join(words, " ");
    words = splitTokens(entireplay, " ,!?.;:");
    IntDict concordance = new IntDict();
    
    for (int i=0; i<words.length; i++){
      concordance.increment(words[i].toLowerCase());
    }
    concordance.sortValues();

    String[] keys = concordance.keyArray();
    for (int i=0; i<keys.length; i++) {
      int count = concordance.get(keys[i]);
      println(keys[i], count);
    }
  }
  
  // video 5
  void n8() {
    Table t = loadTable("2014-02 - Citi Bike trip data.csv");
    TableRow row = t.getRow(0);
    println(row.getInt("tripduration"));
  }
}

Part_13 p = new Part_13();

void setup() {
  size(600, 400);
  background(0);
  
  //p.n1();
  //p.n2();
  
  //p.n3();
  //p.n4();
  //p.n5();
  
  //p.n6();
  
  //p.n7();
  
  p.n8();
}
