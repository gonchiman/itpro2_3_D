class SortFrequencyService
    # @param [Hash]
    # @return [Array<Array(String, Integer)>]
    def self.sort_by_alphabet_asc(word_freqs)
        sorted = word_freqs.sort_by do |word, freq|
            word
        end
    end

    # @param [Hash]
    # @return [Array<Array(String, Integer)>]
    def self.sort_by_alphabet_desc(word_freqs)
        sorted = word_freqs.sort_by do |word, freq|
            word
        end.reverse
    end

    # @param [Hash]
    # @return [Array<Array(String, Integer)>]
    def self.sort_by_frequency_asc(word_freqs)
        sorted = word_freqs.sort_by do |word, freq|
            [freq, word]
        end
    end

    # @param [Hash]
    # @return [Array<Array(String, Integer)>]
    def self.sort_by_frequency_desc(word_freqs)
        sorted = word_freqs.sort_by do |word, freq|
            [-freq, word]
        end
    end
end