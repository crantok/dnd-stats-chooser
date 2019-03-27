#!/usr/bin/env ruby

#
# Copyright 2019 Justin Hellings (info@justinhellings.uk)
#
# This file is part of dnd-stats-chooser.
# The full project can be found at https://github.com/crantok/dnd-stats-chooser
#
# dnd-stats-chooser is free software: you can redistribute it and/or modify it
# under the terms of the GNU Affero General Public License as published by the
# Free Software Foundation, either version 3 of the License, or (at your option)
# any later version.
#
# dnd-stats-chooser is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with dnd-stats-chooser. If not, see http://www.gnu.org/licenses/.
#

# Print out a readme explaining what the programs does and showing its output.

# Single string for introduction to information
intro = "# dnd-stats-chooser

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
"

File.open( './README.md', 'w' ) do |file|
  file.write intro
  file.write `./scores.rb`.gsub(/^/,'    ')
end
