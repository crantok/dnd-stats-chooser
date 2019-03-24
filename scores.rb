#!/usr/bin/env ruby
#
require 'pp'

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

  score_sets = []

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
      score_sets += gen_point_sets(
        partial_score_set + [points_to_allocate],
        points_remaining - points_to_allocate,
        idx,
        level+1
      )
    end
  end

  score_sets
end


point_sets = gen_point_sets( [], TOTAL_POINTS, 0, 0 )
pp point_sets

score_sets = point_sets.map {|a| a.map {|p| POINTS_TO_SCORE[p] } }

modifier_sets = score_sets.map {|a| a.map {|s| SCORE_TO_MODIFIER.call(s) } }

total_modifiers = modifier_sets.map {|a| a.reduce(:+)}

pp (1...point_sets.length).map{|i| [score_sets[i],modifier_sets[i],total_modifiers[i]]}
