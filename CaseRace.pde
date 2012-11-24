
ArrayList racers;
ArrayList teams;

float numberOfTeams;

Racer jeff;
Racer kirby;
Racer ryan;
Racer nate;
Racer mike;
Racer liam;

int minutes; 

void setup() 
{
  minutes = 0;
  
  ////////===========================Setup Teams================================////
  racers = new ArrayList();
  teams = new ArrayList();
  
  jeff = new Racer("Jeff", 1.5, 2.5);
  kirby = new Racer("Kirby", 0.8, 1.0);
  ryan = new Racer("Ryan", 1.0, 2.0);
  nate = new Racer("Nate", 2.0, 2.0);
  mike = new Racer("Mike", 1.5, 2.5);
  liam = new Racer("Liam", 3.0, 3.0);
  
  racers.add(jeff);
  racers.add(kirby);
  racers.add(ryan);
  racers.add(nate);
  racers.add(mike);
  racers.add(liam);
  
  pickTeams();
  
  ////////===========================Setup Interface================================////
  size(1200,800);
  background(0,0,0);
  smooth();
  
  for (int i = 0; i < numberOfTeams; i++)
  { 
    Team tmpTeam = (Team) teams.get(i);
    textSize(20);
    int teamTextX = 100 + 100*i;
    
    fill(0, 102, 153);
    text("Team " + (i+1), teamTextX, 700); 
    
    int yOffset = 0;
    for(int j = 0; j < 3; j++)
    {
      yOffset += 20;
      Racer tmpRacer = (Racer) tmpTeam.getRacer(j);
      text(tmpRacer.name, teamTextX, 700 + yOffset);
      
    }
    
  }
}

void draw()
{
  //make every team drink
  for (int i = 0; i < numberOfTeams; i++)
  {
    Team tmpTeam = (Team) teams.get(i);
    tmpTeam.drink();
  }

  minutes++;
  println(minutes);
}

void pickTeams()
{
  //find the correct number of teams
  numberOfTeams = racers.size()/3;
  
  //create an array of teams
  for(int i = 0; i < numberOfTeams; i++)
  {
    Team team = new Team();
    teams.add(team);
  }
  
  for (int j = 0; j < numberOfTeams; j ++)
  {
    Team tmpTeam = (Team) teams.get(j);
    for (int k = 0; k < 3; k ++)
      {
      //gets random racer index  
      int randomRacerIndex = (int)random(0, racers.size());
      
      //selects random racer
      Racer pickedRacer = (Racer) racers.get(randomRacerIndex);
      
      //puts racer on team
      tmpTeam.addRacer(pickedRacer);
      
      //removes racer from racers array
      racers.remove(randomRacerIndex);
      }
  }
}
