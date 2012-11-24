class Racer
{
  //metadata
  String name;
  //PImage picture;
  
  //variables
  float tolerance;
  float maxOunces;
  
  float maxBac; //breakpoint
  float processRate = 0.00033; //ounces per minute
  float beerIntakeRate;
  float beerDrank; //score
  float bac = 0.0f;
  boolean thrownUp;
  
  Racer(String _name,  float _tolerance, float _maxOunces)
  {
  name = _name;
 // picture = _picture;
  tolerance = _tolerance;
  maxOunces = _maxOunces;
  maxBac = calcMaxBac();
  }
  
  void drink()
  {
    beerIntakeRate = calcBeerIntake();
    println("intake is: "+ beerIntakeRate);
    bac = calcBac(beerIntakeRate);
    println("BAC is: " + bac);
    beerDrank += beerIntakeRate;
    println("beerDrank: " + beerDrank);
    
    if (bac > maxBac)
    {
      throwUp();
    }
    
    if (beerDrank >= 288.0)  
    {
      noLoop();
    }
  }
  
  void processAlcohol()
  {
    bac = (bac - processRate);
  }
  
  void throwUp()
  {
    thrownUp = true;
  }
  
  float calcBeerIntake()
  {
    float intake = random(0.0, maxOunces);
    return intake;
  }
  
  float calcMaxBac()
  {
    float theMax = 0.135 * tolerance;
    return theMax;
  }
  
  float calcBac(float intake)
  {
    float tmpBac = bac + (intake * 0.0016);
    return tmpBac;
  }
  
}
