# frozen_string_literal: true

# High score table from code wars
class HighScoreTable
  def initialize(size)
    @size = size
    @scores = []
  end
  attr_accessor :scores
  def update(new_score)
    scores << new_score
    self.scores = scores.max(size)
  end

  def reset
    scores.clear
  end
end
