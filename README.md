# dnd-stats-chooser

In D&D 5e, one way of choosing the ability scores for a new character is to use the 27 point system. There are 65 combinations of ability scores that cost exactly 27 points. Depending on your character's race some combinations are better value than others. I wrote dnd-stats-chooser to help you choose the best value combination for your character.

> My name is Justin Hellings. I wrote dnd-stats-chooser. I am also a life coach. That means I help people to understand what they want from life and to deal with the things that get in the way of that. I am in Manchester in the UK. If you would like to know more, go to https://justinhellings.uk

### Modifiers rather than scores
You might never use your ability scores directly in D&D. Usually you use your ability modifiers (-1, 0, +1, +2, etc). So when you are spending points on ability scores, you probably care more about what ability *modifiers* you are buying.

### Prefer even scores over odd scores
In D&D 5e, odd ability scores give you the *same* ability modifier as the even ability score that is one lower. For example, scores of 12 and 13 both give you a modifier of +1. Why would you pay the extra for a score of 13 when you could have a +1 modifier by buying 12? (An interesting(?) fact: Of the 65 combinations that cost 27 points, only three of them have all even scores.)

### Race ability bonuses of +1
There is one circumstance under which choosing an odd ability score is good value; when you want to add a +1 race bonus to the score. This flips the odd/even preference: Adding a race bonus of +1 to an even ability score does not change the modifier you get. For example, an ability score of 14 gives you a +2 ability modifer; add a +1 race bonus to give a score of 15 and you still only have a +2 modifier.

### Different best-value scores for different character races
So the number of +1 ability score bonuses that your character's race gets, will dictate which 27 point score combinations are best value. Humans are all about the +1s. Unfortunately, you can't get an all-odd set of scores for 27 points. To make the most of their bonuses, a human character can choose a combination with 5 odd ability scores. Other races will want fewer odd ability scores to add their +1 bonuses to.
    
      Half-elves get two +1 bonuses
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
    
    
      Most races get a single +1 bonus
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
    
    
      Humans get six +1 bonuses.
      You can choose combinations with a maximum of five odd scores.
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
    
    
      Mountain dwarfs have no +1 bonuses. If you want more variety of modifier
      combinations (like +2 +2 +1 +1 0 0) look at results for a single +1 race bonus.)
    -------------------------------------------------------------------------
    Ability scores              Ability modifiers                  Sum of base modifiers
    before race bonuses         
    -------------------------------------------------------------------------
    14  14  14  12  10   8       +2   +2   +2   +1    0   -1       6
    14  14  14  10  10  10       +2   +2   +2    0    0    0       6
    14  12  12  12  12  12       +2   +1   +1   +1   +1   +1       7
