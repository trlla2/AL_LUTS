

PImage img;
PImage img2;


float VAL_R = 0.3f;
float VAL_G = 0.59f;
float VAL_B = 0.11f;


void setup(){
  size(800,346);
  img = loadImage("tomaquet.jpg");
  img2 = loadImage("tomaquet.jpg");
  
  // P.e passar imagen a blanco y negro  --> luma = 0.029R+0.587G+0.114B <-- LUT
  // para passar a color invertido divide entre 1
  for(int i = 0; i<img2.width; i++){
    for(int j= 0; j <img2.height; j++){
        int index = i + j * img2.width; // passar array 2d a 1d cause imagenes son arrays 1d
        
        color ImgCol = img2.pixels[index];
        
        color temp;
        //temp = color((red(ImgCol)*VAL_R) + (green(ImgCol)*VAL_G) + (blue(ImgCol)*VAL_B)); // samuel l jackson y pedro pascal(negro y blanco)
        if((red(ImgCol)*VAL_R) + (green(ImgCol)*VAL_G) + (blue(ImgCol)*VAL_B) < 127.5f){// binareo se printa blanco o negro segun
          temp = color(0); 
        }
        else{
          temp = color(255); 
        }
        //temp = color(abs(red(ImgCol) - 255), abs(green(ImgCol) - 255), abs(blue(ImgCol)- 255)); // evil tomaquet
        img2.pixels[index] = temp;
        
        img2.updatePixels();
    }
  }

}

void draw(){
  image(img,0,0);
  
  
  
  image(img2,400,0);

}
