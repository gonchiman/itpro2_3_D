class FrequencyDistributionService
  # @param [Hash{String => Integer}]
  # @return [Hash{Integer => Integer}]
  def self.build(word_freqs)
    distribution = Hash.new(0)

    word_freqs.each_value do |freq|
      distribution[freq] += 1
    end

    distribution.sort.to_h
  end
end