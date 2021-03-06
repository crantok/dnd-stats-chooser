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

#
# dnd-stats-chooser - Within the contex of the points-allocation system for
# choosing ability scores for a D&D 5e character; print out the sets of ability
# scores (and relevant analysis) that are most points-efficient for different
# race bonuses.
#

POINTS = [9,7,5,4,3,2,1,0]

TOTAL_POINTS = 27

POINTS_TO_SCORE = { 0=>8, 1=>9, 2=>10, 3=>11, 4=>12, 5=>13, 7=>14, 9=>15 }

NUM_SCORES_PER_SET = 6

SCORE_TO_MODIFIER = -> (score) { -5 + (score - score%2) / 2 }

def gen_point_sets partial_score_set, points_remaining, min_points_idx, level

  if partial_score_set.length == NUM_SCORES_PER_SET
    if points_remaining == 0
      # We used the correct number of points
      return [partial_score_set]
    else
      # Is this necessary? Surely we've caught this already.
      puts "Allocated #{NUM_SCORES_PER_SET} scores (#{partial_score_set}) and still have #{points_remaining} points left."
      return []
    end
  end

  points_sets = []

  ( min_points_idx...POINTS.length ).each do |idx|

    points_to_allocate = POINTS[idx]
    # puts
    # puts "level: #{level}"
    # pp partial_score_set
    # puts "index: #{idx}"
    # puts "points to allocate: #{points_to_allocate}"
    # puts "points remaining: #{points_remaining}"

    if points_remaining < points_to_allocate
      # Not enough points left to allocate. Abort
      # puts "current points to allocate is too big"
      next
    elsif points_remaining > (NUM_SCORES_PER_SET - partial_score_set.length) * points_to_allocate
      # Even if we used the maximum number of points for all remaining scores,
      # we would still not use up all the points.
      # puts "all remaining points to allocate are too small"
      next
    else
      points_sets += gen_point_sets(
        partial_score_set + [points_to_allocate],
        points_remaining - points_to_allocate,
        idx,
        level+1
      )
    end
  end

  points_sets
end


def build_results point_sets
  point_sets.map do |points|
    [
      scores = points.map {|p| POINTS_TO_SCORE[p] },
      mods = scores.map {|s| SCORE_TO_MODIFIER.call(s) },
      mods.reduce(:+)
    ]
  end
end

def filter_for_odd_scores num, results
  results.select {|r| num == r[0].reduce(0){|n,s| n+=s%2 }}
end

def mark_ability_modifier to_mark, score, modifier
  mod_str = ('%+2d' % modifier).sub('+0',' 0')
  if ( to_mark == :odd && (score%2 == 1) ) ||
    ( to_mark == :even && (score%2 == 0) )
    return '(' + mod_str + ')'
  else
    return ' ' + mod_str + ' '
  end
end

def display_results results, to_mark
  col_widths = [28,35]
  col_formats = col_widths.map{|w|"%-#{w}s"}

  puts '-' * (col_widths.reduce(:+)+10)

  puts ( col_formats[0] % 'Ability scores' ) +
  ( col_formats[1] % ('Ability modifiers' + (to_mark.nil? ? '' : ' with')) ) +
  'Sum of base modifiers'

  puts ( col_formats[0] % 'before race bonuses' ) +
  ( to_mark.nil? ? '' : (col_formats[1] % "(#{to_mark}) ability scores marked") )

  puts '-' * (col_widths.reduce(:+)+10)

  results.each do |r|
    line = col_formats[0] % r[0].map{|s| '%2s' % s.to_s}.join('  ')
    line += col_formats[1] % r[1].each_with_index.map{|m,i| mark_ability_modifier(to_mark,r[0][i],m)}.join(' ')
    puts line + r[2].to_s
  end
end


results = build_results( gen_point_sets( [], TOTAL_POINTS, 0, 0 ) )
# puts results.length
# pp results.sort { |x,y| y[2] <=> x[2] }
# puts

puts "  Ability scores optimised for a single +1 bonus"
display_results(filter_for_odd_scores(1,results), :odd)
puts

puts "
 **********************************************************************************************
 *                     This program was written by Justin Hellings.                           *
 *            Justin is a life coach in Manchester in the UK. He is also a geek.              *
 *  If you'd like to know more about his life coaching work, go to https://justinhellings.uk  *
 **********************************************************************************************


"

puts "  Ability scores optimised for a three +1 bonuses"
display_results(filter_for_odd_scores(3,results), :odd)
puts
