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
# pp point_sets
score_sets = point_sets.map {|a| a.map {|p| POINTS_TO_SCORE[p] } }


def build_results score_sets
  score_sets.map do |ss|
    [
      ss,
      mods = ss.map {|s| SCORE_TO_MODIFIER.call(s) },
      mods.reduce(:+)
    ]
  end
end

# pp build_results(score_sets)

def filter_for_odd_numbers num, score_sets
  score_sets.select {|a| num == a.reduce(0){|n,s| n+=s%2 }}
end

puts "humans: max odd numbers = 5"
pp build_results(filter_for_odd_numbers(5,score_sets))

puts
puts "half-elves: num odd numbers = 2"
pp build_results(filter_for_odd_numbers(2,score_sets))

puts
puts "lots of races: num odd numbers = 1"
pp build_results(filter_for_odd_numbers(1,score_sets))

puts
puts "mountain dwarf: num odd numbers = 0"
pp build_results(filter_for_odd_numbers(0,score_sets))
