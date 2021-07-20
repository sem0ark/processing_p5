
int[] left, right, arr;
int Max_Lim = 100000;
int n = 1000;



void setup() {
  size(1000, 800);
  frameRate(100);
  noLoop();
  
  arr = new int[n];
  //for (int i=0; i<n; i++) {
  //  arr[i] = floor(random(0,Max_Lim));
  //}
  //qsort(0, arr.length-1);
  
  for (int i=0; i<n; i++) {
    arr[i] = floor(random(0,Max_Lim));
  }
  //bubble();
}


void draw() {
  float dx = (width / (float) arr.length);
  float dy = (height / (float) Max_Lim);
  
  background(0);
  stroke(255);
  
  for (int i=0; i<arr.length; i++) {
    line(dx*i, height - dy * arr[i], dx*i, height);
  }
}


//better version
void qsort(int st, int en) {
  if (st<en) {
    int pivot = arr[(st+en)/2];
    int l = st;
    int r = en;
    int c;
    while (l <= r) {
      while (arr[l]<pivot) {l++;}
      while (arr[r]>pivot) {r--;}
      if (l<=r) {
        c=arr[l]; arr[l]=arr[r]; arr[r]=c;
        l++; r--;
      }
    }
    qsort(st, r);
    qsort(l, en);
  }
}

//selection sort
void gnome_sort() {
  int m, mi, t;
  for (int c=0; c<arr.length-1; c++) {
    mi = c+1;
    for (int i=c+1; i<arr.length; i++) {
      if (arr[i] < arr[mi]) {mi = i;}
    }
    t=arr[c]; arr[c]=arr[mi]; arr[mi]=t;
  }
}

//bubble sort
void bubble() {
  int t; boolean fg = true;
  for (int i=0; i<arr.length; i++) {
    for (int j=i+1; j<arr.length; j++) {
      if (arr[i] > arr[j]) {
        t=arr[j]; arr[j]=arr[i]; arr[i]=t;
      }
    }
  }
}
