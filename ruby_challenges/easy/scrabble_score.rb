class Scrabble
  def initialize(scrabble)
    @scrabble = scrabble
  end

  SCORE_GUIDE = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z),
  }

  def score
    return 0 if ['', nil].include?(@scrabble)
    
    @scrabble.chars.inject(0) do |points, char|
      SCORE_GUIDE.each { |k, v| points += k if v.include?(char.upcase) }
      points
    end
  end

  def self.score(scrabble)
    Scrabble.new(scrabble).score
  end
end