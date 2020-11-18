class Scene { // mostly code made by Dylan
  
  //scene info
  
  public PImage background_Image;
  public String scene_Name;
  public SceneTransitionArea[] transitionAreas; //list of transition areas
  public InteractiveObject[] objects; //list of objects that are interactive (added by Izabella)
  
  //scene constructor
  public Scene(String background_File, String newSceneName){
    
    //load backgriun image from a file
    background_Image = loadImage(background_File);
    
    //make sure image fits screen
    background_Image.resize(1000, 800);
    
    //set scene name
    scene_Name = newSceneName;
  }
  
  //draw the scene
  public void Draw() {
    //show background image
    image(background_Image, 0, 0);
    
    //name of the scene display
    fill(255);
    textSize(20);
    textAlign(CENTER, TOP);
    text(scene_Name, width/2, 10);
    
    //overlay to test transition scenes
    fill(0, 255, 0, 150);
    noStroke();
     if (transitionAreas != null) {
      //For every Transition Area...
      for (int i = 0; i < transitionAreas.length; i++) {
        //Draw a rect overlay.
        rect(transitionAreas[i].x, transitionAreas[i].y, transitionAreas[i].areaWidth, transitionAreas[i].areaHeight);
      }
    }
    //added by Izabella test interactive items
    fill (255, 0, 0, 150);
    noStroke();
    //are there interactive objects?
    if (objects != null){
      //every object
      for (int i = 0; i<objects.length; i++){
        //rect overlay
        rect(objects[i].x, objects[i].y, objects[i].areaWidth, objects[i].areaHeight);
      }
    }
  }
  
  public void MouseClicked(){
    //are there transitions?
    if(transitionAreas != null){
      //every transition area
      for(int i = 0; i< transitionAreas.length; i++){
        // did user click??
        if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, 
                                                        transitionAreas[i].x,
                                                        transitionAreas[i].y,
                                                        transitionAreas[i].areaWidth,
                                                        transitionAreas[i].areaheight){
           //change scene if transition was clicked
           Game_First_Contact.ChangeScene(transitionAreas[i].destinationScene);
          }
      }
    }
  }
  
  public void MouseHover(){
    //are there transition areas?
    if (transitionAreas !=null){
      //every area
      for (int i = 0; i<transitionAreas.length; i++){
        //mouse hovers over?
        if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, 
                                                        transitionAreas[i].x,
                                                        transitionAreas[i].y,
                                                        transitionAreas[i].areaWidth,
                                                        transitionAreas[i].areaheight){
           // if yes, change cursor and stop checking
           cursor(HAND);
           return;
         }
      }
      //object checking added by Izabella
      //are there objects?
      if(objects != null){
        for (int i = 0; i<objects.length; i++){
           //mouse hovers over?
          if (Game_First_Contact.CheckPointOnBoxCollision(mouseX, mouseY, 
                                                          transitionAreas[i].x,
                                                          transitionAreas[i].y,
                                                          transitionAreas[i].areaWidth,
                                                          transitionAreas[i].areaheight){
             // if yes, change cursor and stop checking
             cursor(HAND);
             return;
          }
         }
       }
    }
    //if not on transition area or interactive object, the cursor is an arrow
    cursor(ARROW);
  }
}
  