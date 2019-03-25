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

In D&D 5e, one way of choosing the ability scores for a new character is to use the 27 point system. There are 65 valid combinations of stats that cost exactly 27 points. This program was written to help you choose the best combination for your character.


    **********************************************************************************************
    *                     This program was written by Justin Hellings.                           *
    *            Justin is a life coach in Manchester in the UK. He is also a geek.              *
    *  If you'd like to know more about his life coaching work, go to https://justinhellings.uk  *
    **********************************************************************************************



When you choose your ability scores this way, you want maximum bang for your buck. Ignoring race bonuses, you would only choose even values for ability scores because the next higher value (which is obviously an odd value) give you same modifier as the lower even value.

*BUT* this does not take into account ability score bonus that you get because of your character's race. Some of these race bonuses are +1. Adding one to an even value of ability score will not increase the modifier it gives you, so in this case you *want* an odd number to add this +1 bonus to.

Different character races have different numbers of +1 ability bonuses, so they require different base values in order to use their bonuses as efficiently as possible. The output of this program shows the efficient combinations for the character races listed in the D&D 5e player's handbook.

"

File.open( './README.md', 'w' ) do |file|
  file.write intro
  file.write `./scores.rb`.gsub(/^/,'    ')
end
