class Team
{
  ArrayList racers = new ArrayList();
  int totalBeersDrank;    //score
  boolean disqualified;
  boolean hasDrankEntireCase;
  
  void calcScore()
  {
    for (int i = 0; i < racers.size(); i++)
    {
      Racer racer = (Racer) racers.get(i);
      totalBeersDrank += racer.beerDrank;
      
      if (totalBeersDrank == 288)
      {
        hasDrankEntireCase = true;
        noLoop();
      } 
    }
  }
  
  void addRacer(Racer theRacer)
  {
    racers.add(theRacer);
  }
  
  Racer getRacer(int racerIndex)
  {
    return (Racer) racers.get(racerIndex);
  }
  
  void drink()
  {
    //make each racer drink and process alcohol
    for (int i = 0; i < racers.size(); i++)
    {
      Racer tmpRacer = (Racer) racers.get(i);
      tmpRacer.drink();
      tmpRacer.processAlcohol();
      
      //calc score
      calcScore();
      
      //check disqualified
      if (tmpRacer.thrownUp)
      {
        disqualified = true;
        println(tmpRacer.name + "threw up!");
      }
    } 
  }
  
}

