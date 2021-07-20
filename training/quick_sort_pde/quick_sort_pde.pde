
int[] left, right, test_arr;
int Max_Lim = 100000;


void setup() {
  int n = 1000000;
  test_arr = new int[n];
  for (int i=0; i<n; i++) {
    test_arr[i] = floor(random(0,Max_Lim));
  }
  int time = millis();
  quick_sort(test_arr, 0, test_arr.length-1);
  println(millis() - time);
 
  for (int i=0; i<n; i++) {
    test_arr[i] = floor(random(0,100000));
  }
  time = millis();
  qsort(test_arr, 0, test_arr.length-1);
  println(millis() - time);
  
  //for (int i=0; i<n; i++) {
  //  test_arr[i] = floor(random(0,100000));
  //}
  //time = millis();
  //gnome_sort(test_arr);
  //println(millis() - time);
  
  //for (int i=0; i<n; i++) {
  //  test_arr[i] = floor(random(0,100000));
  //}
  //time = millis();
  //bubble(test_arr);
  //println(millis() - time);
}

//self understood version
void quick_sort(int[] arr, int l, int r) {
  if (l<r) {
    int pivot = arr[l];
    int cl=0, cr=0;
    for (int i = l+1; i<=r; i++) {
      if (arr[i] > pivot) {cr++;} else {cl++;}
    }
    left  = new int[cl];
    right = new int[cr];
    cl=0;
    cr=0;
    for (int i=l+1; i<=r; i++) {
      if (arr[i] > pivot) {
        right[cr] = arr[i];
        cr++;
      } else {
        left[cl] = arr[i];
        cl++;
      }
    }
    for (int i=0; i<cl; i++) {arr[l+i] = left[i];}
    arr[l+cl] = pivot;
    for (int i=0; i<cr; i++) {arr[i+l+cl+1] = right[i];}
    quick_sort(arr, l, l+cl-1);
    quick_sort(arr, l+cl+1, r);
  }
}


//better version
void qsort(int[] arr, int st, int en) {
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
    qsort(arr, st, r);
    qsort(arr, l, en);
  }
}

//choosing sort (? gnome sort)
void gnome_sort(int[] arr) {
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
void bubble(int[] arr) {
  int t; boolean fg = true;
  while (fg) {
    fg = false;
    for (int i=0; i<arr.length-1; i++){
      if (arr[i]>arr[i+1]) {
        t=arr[i+1]; arr[i+1]=arr[i]; arr[i]=t;
        fg = true;
      }
    }
  }
}

//merge sort
void merge(int[] arr, int st, int en) {
  if (en-st == 2 && arr[en]<arr[st]) {
    int t;
    t=arr[en]; arr[en]=arr[st]; arr[st]=t;
  } else {
    int c = (st+en) / 2;
    merge(arr, st, c);
    merge(arr, c+1, en);
    
    int l=st, r=c+1;
    
  }
}
