void setup(){
  size(1000, 800);
  
}

//Check for collision between a single point and a rectangle/box
public static boolean CheckPointOnBoxCollision(float pointX, float pointY, 
                                               float targetX, float targetY, 
                                               float targetWidth, float targetHeight) {
  if (pointX >= targetX
    && pointX <= targetX + targetWidth
    && pointY >= targetY
    && pointY <= targetY + targetHeight) {
    return true;
  }

  return false;
}
