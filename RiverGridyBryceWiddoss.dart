//By Bryce Widdoss
import 'dart:math';

//create a 10x10 (n x n) grid
//with random numbers 1-10 in each cell

//List of Lists creating a grid of size n x n

// Extended to have subclass of a river. This helps us to orient the objects while programming.

class Gridy
{
    List<List<int>> madeGrid;

    // Constructor
    Gridy(int s) : madeGrid = []
    {
        madeGrid = createGrid(s);
        print('created da grid');
    }

    // print grid row by row
    void printGrid() 
    {
      for(int i = 0; i < madeGrid.length; i++) 
      {
        print("${madeGrid[i]}"); // print every particular row
      }
    }
 
    
    void setVal(int x, int y, int value)
    {
      int s = madeGrid.length;
      if ((x < s) && (x >= 0))
      {
        if ((y < s) && (y >= 0)) 
        {
          if (value > madeGrid[x][y]) // so that we dont destroy the other 
                                      //village town <3
          {
            madeGrid[x][y] = value;
          }
        }
      }
    }
  
  
    void setAllVals(int x1, int y1)
    {
      setVal(x1-1, y1, 50);
      setVal(x1, y1-1, 50);
      setVal(x1+1, y1, 50);
      setVal(x1, y1+1, 50);
      setVal(x1-1, y1-1, 25);
      setVal(x1+1, y1-1, 25);
      setVal(x1-1, y1+1, 25);
      setVal(x1+1, y1+1, 25);
      setVal(x1-2, y1, 25);
      setVal(x1, y1-2, 25);
      setVal(x1+2, y1, 25);
      setVal(x1, y1+2, 25);
    }
  
  
    // City populate function
    void cityPopulate() 
    {
      Random rng = Random();
      int s = madeGrid.length;
      int x1 = rng.nextInt(s); // pick first location x
      int y1 = rng.nextInt(s); // pick first location y
      madeGrid[x1][y1] = 100;
      setAllVals(x1, y1);
      
      int x2 = rng.nextInt(s); // pick first location x
      int y2 = rng.nextInt(s); // pick first location y
      madeGrid[x2][y2] = 100;
      setAllVals(x2, y2);

    }
  }


List< List<int> > createGrid(int n) 
{
    Random rng = Random();
    List < List<int> > grid = [];
    for(int i = 0; i < n; i++) 
    {
        List<int> row = [];
        for(int i = 0; i < n; i++) 
        {
            row.add(rng.nextInt(10)+1);
        }
        grid.add(row);
    }
    return grid;
}


class RiverGrid extends Gridy{

  RiverGrid(int s) : super(s) 
  {
    madeGrid = addRiver(madeGrid);
    print('Added river yay');
  }


  List<List<int>> addRiver(List<List<int>> grid) {
    Random rng = Random();
    int s = madeGrid.length;
    int sacrificedX = rng.nextInt(s-1)+1; // I really DONT feel like dealing with rivers on the edge! Thats more edge cases.

    for (int i = 0; i < grid.length; i++) {
      int oldVal = grid[i][sacrificedX];
      
      if (sacrificedX - 1 >= 0) { // technically redundant
        grid[i][sacrificedX - 1] += (oldVal / 2).round();
      }

      if (sacrificedX + 1 < s) {
        grid[i][sacrificedX + 1] += (oldVal / 2).round(); // better to double a person that to kill one!
      }

      grid[i][sacrificedX] = 0;
    }

    return grid;
  }

}



void main() 
{ 
    Gridy puppy = Gridy(4);

    puppy.printGrid();
  
    puppy.cityPopulate();
  
    print('------------------------------');
    print('Populated City Land:');
  
    puppy.printGrid();

    print('------------------------------');
    print('River Grid:');

    RiverGrid meow = RiverGrid(7);

    meow.printGrid();

  
// no such thing as puppy.madeGrid  ??

//     //what's in cell indexed by 3,3?
//     print("${grid[3][3]}"); sooo true

}