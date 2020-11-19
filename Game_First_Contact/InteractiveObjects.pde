class InteractiveObject{
  
  public PImage objectImage;
  float x;
  float y;
  int areaWidth;
  int areaHeight;
  boolean pickUp;
  //public String objectFileA;
  
  public InteractiveObject (float newX, float newY,
                            int newWidth, int newHeight, 
                            String objectFile, boolean canPickUp){
                              
    //objectFileA = objectFile;
    objectImage = loadImage(objectFile);
    x = newX;
    y = newY;
    areaWidth = newWidth;
    areaHeight = newHeight;
    objectImage.resize(areaWidth, areaHeight);
    pickUp = canPickUp;
  }
}
