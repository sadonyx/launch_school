class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    cut_by = [@strand.size, distance.size].sort[0] - 1
    strand = @strand[0..cut_by].chars
    dist = distance[0..cut_by].chars

    counter = 0

    strand.each_with_index do |char, index|
      counter += 1 if char != dist[index]
    end

    counter
  end
end