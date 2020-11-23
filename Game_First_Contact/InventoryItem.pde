class InventoryItem {
  public PImage objectImage;
  public String itemName;

  public InventoryItem(String objectFile, String newName) {
    //objectFileA = objectFile;
    objectImage = loadImage(objectFile);
    itemName = newName;
  }
}
