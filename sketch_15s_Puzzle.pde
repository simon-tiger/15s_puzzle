int cols = 4;
int rows = 4;
int numCells = cols * rows;
int scl = 400 / cols;
int[] cells = new int[numCells];
PFont font;

void setup() {
  size(401, 401);
  
  reset();
  
  font = createFont("Arial", 48);
}

void draw() {
  background(255);
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int index = i + j * cols;
      
      stroke(0);
      noFill();
      if (cells[index] > 0) {
        fill(175, 0, 255);
      }
      rect(i*scl, j*scl, scl, scl);
      
      if (cells[index] > 0) {
        fill(0, 255, 0);
        textSize(48);
        textFont(font);
        textAlign(CENTER, CENTER);
        text(cells[index], i*scl + scl/2, j*scl + scl/2);
      }
    }
  }
}

void keyPressed() {
  int index = findZero(cells);
  int up = index - cols;
  int right = index + 1;
  int down = index + cols;
  int left = index - 1;
  
  if (index < cols) {
    up = index;
  } else if (index % cols == cols - 1) {
    right = index;
  } else if (index > numCells - cols) {
    down = index;
  } else if (index % cols == 0) {
    left = index;
  }
  
  if (key == CODED) {
    if (keyCode == UP) {
      swap(cells, index, down);
    } else if (keyCode == RIGHT) {
      swap(cells, index, left);
    } else if (keyCode == DOWN) {
      swap(cells, index, up);
    } else if (keyCode == LEFT) {
      swap(cells, index, right);
    }
  }
  if (key == 'r' && key == 'R') {
    reset();
  }
}

void reset() {
  for (int i = 0; i < numCells; i++) {
    cells[i] = i + 1;
  }
  
  swap(cells, numCells-3, numCells-2);
  cells[numCells-1] = 0;
}

int findZero(int[] arr) {
  int index = -1;
  
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == 0) {
      index = i;
      break;
    }
  }
  
  return index;
}

void swap(int[] arr, int i, int j) {
  int temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}