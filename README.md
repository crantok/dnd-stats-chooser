# dnd-stats-chooser

In D&D 5e, one way of choosing the ability scores for a new character is to use the 27 point system. There are 65 combinations of ability score values that cost exactly 27 points. This program was written to help you choose the best combination for your character.


    **********************************************************************************************
    *                     This program was written by Justin Hellings.                           *
    *            Justin is a life coach in Manchester in the UK. He is also a geek.              *
    *  If you'd like to know more about his life coaching work, go to https://justinhellings.uk  *
    **********************************************************************************************



When you choose your ability scores this way you want maximum bang for your buck. Ignoring race bonuses, you would only choose even values for ability scores because the next higher value (which is obviously an odd value) would give you the same modifier as the cheaper even value. For example, an ability score of 13 costs more than an ability score of 12, but they both give you a modifier of +1.

*BUT* this does not take into account ability score bonuses that you get because of your character's race. Some of these race bonuses are +1. Adding one to an even value of ability score will not increase the modifier it gives you, which would make the +1 bonus pretty pointless. So in this case you *want* an odd value to add this +1 bonus to.

Different character races have different numbers of +1 ability bonuses, so they require different base values in order to use their bonuses as efficiently as possible. The output of this program shows the efficient combinations for the character races listed in the D&D 5e player's handbook.

    
      Half-elves: number of odd ability score values before race bonuses = 2
    -------------------------------------------------------------------------
    Ability scores              Ability modifiers with             Sum of base modifiers
    before race bonuses         (odd) ability scores marked        
    -------------------------------------------------------------------------
    15  15  14  10   8   8      (+2) (+2)  +2    0   -1   -1       4
    15  14  13  12  10   8      (+2)  +2  (+1)  +1    0   -1       5
    15  14  13  10  10  10      (+2)  +2  (+1)   0    0    0       5
    15  14  12  12  11   8      (+2)  +2   +1   +1  ( 0)  -1       5
    15  14  12  12  10   9      (+2)  +2   +1   +1    0  (-1)      5
    15  14  12  11  10  10      (+2)  +2   +1  ( 0)   0    0       5
    14  14  14  13   9   8       +2   +2   +2  (+1) (-1)  -1       5
    14  14  14  12   9   9       +2   +2   +2   +1  (-1) (-1)      5
    14  14  14  11  11   8       +2   +2   +2  ( 0) ( 0)  -1       5
    14  14  14  11  10   9       +2   +2   +2  ( 0)   0  (-1)      5
    14  13  13  12  12  10       +2  (+1) (+1)  +1   +1    0       6
    14  13  12  12  12  11       +2  (+1)  +1   +1   +1  ( 0)      6
    
    
      Lots of races: number of odd ability score values before race bonuses = 1
    -------------------------------------------------------------------------
    Ability scores              Ability modifiers with             Sum of base modifiers
    before race bonuses         (odd) ability scores marked        
    -------------------------------------------------------------------------
    15  14  14  12   8   8      (+2)  +2   +2   +1   -1   -1       5
    15  14  14  10  10   8      (+2)  +2   +2    0    0   -1       5
    15  12  12  12  12  10      (+2)  +1   +1   +1   +1    0       6
    14  14  13  12  12   8       +2   +2  (+1)  +1   +1   -1       6
    14  14  13  12  10  10       +2   +2  (+1)  +1    0    0       6
    14  14  12  12  12   9       +2   +2   +1   +1   +1  (-1)      6
    14  14  12  12  11  10       +2   +2   +1   +1  ( 0)   0       6
    
    
     **********************************************************************************************
     *                     This program was written by Justin Hellings.                           *
     *            Justin is a life coach in Manchester in the UK. He is also a geek.              *
     *  If you'd like to know more about his life coaching work, go to https://justinhellings.uk  *
     **********************************************************************************************
    
    
      Humans: number of odd ability score values before race bonuses = 5 (i.e. the maximum)
    -------------------------------------------------------------------------
    Ability scores              Ability modifiers with             Sum of base modifiers
    before race bonuses         (even) ability scores marked       
    -------------------------------------------------------------------------
    15  15  13  11   9   8       +2   +2   +1    0   -1  (-1)      3
    15  15  13  10   9   9       +2   +2   +1  ( 0)  -1   -1       3
    15  15  12  11   9   9       +2   +2  (+1)   0   -1   -1       3
    15  15  11  11  11   8       +2   +2    0    0    0  (-1)      3
    15  15  11  11  10   9       +2   +2    0    0  ( 0)  -1       3
    15  13  13  13  11   8       +2   +1   +1   +1    0  (-1)      4
    15  13  13  13  10   9       +2   +1   +1   +1  ( 0)  -1       4
    15  13  13  12  11   9       +2   +1   +1  (+1)   0   -1       4
    15  13  13  11  11  10       +2   +1   +1    0    0  ( 0)      4
    15  13  12  11  11  11       +2   +1  (+1)   0    0    0       4
    13  13  13  13  13  10       +1   +1   +1   +1   +1  ( 0)      5
    13  13  13  13  12  11       +1   +1   +1   +1  (+1)   0       5
    
    
      Mountain dwarfs: number of odd ability score values before race bonuses = 0
    -------------------------------------------------------------------------
    Ability scores              Ability modifiers                  Sum of base modifiers
    before race bonuses         
    -------------------------------------------------------------------------
    14  14  14  12  10   8       +2   +2   +2   +1    0   -1       6
    14  14  14  10  10  10       +2   +2   +2    0    0    0       6
    14  12  12  12  12  12       +2   +1   +1   +1   +1   +1       7
