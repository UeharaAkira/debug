import  processing.serial.*;

Serial  serial;
int [] x = new int[500];
int [] y = new int[500];
int value,recv_data;
int [] j = new int[5];

void setup() {  
  size(600, 350);
  serial = new Serial( this,"/dev/cu.usbmodem1422", 9600 );
  for (int i = 0; i < x.length; i++){
    x[i] = i;
    y[i] = 128;
  }
}


void draw() {
  
  value = 0;

  for(int k=0; k<4 ;k++){
      j[k+1] = j[k];
  }
  j[0] = recv_data;  

  for(int k=0; k<5 ;k++){
    value += j[k];   
  }
  
  println(value/10);
  
  background(10);
  for (int i = 0; i < y.length - 1; i++){
    y[i] = y[i+1];
  }
  y[y.length - 1] = value/10;
  
  pushMatrix();
  translate(50,300);
  scale(1,-1);
  fill(0);
  stroke(255);
  rect(0,0,500,256);
  stroke(0,255,0);
  for (int i = 0; i < x.length - 1; i++){
    line(x[i],y[i],x[i+1],y[i+1]);
  }
  popMatrix();
}


void serialEvent(Serial port) {  
  recv_data = port.read();
  delay(5);
} 