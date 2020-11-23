class InteractiveObject {

  InventoryItem item;
  float x;
  float y;
  int areaWidth;
  int areaHeight;
  boolean pickUp;
  //public String objectFileA;

  public InteractiveObject (float newX, float newY, 
    int newWidth, int newHeight, 
    String objectFile, boolean canPickUp, String newName) {
    item = new InventoryItem(objectFile, newName);
    x = newX;
    y = newY;
    areaWidth = newWidth;
    areaHeight = newHeight;
    item.objectImage.resize(areaWidth, areaHeight);
    pickUp = canPickUp;
  }
}
