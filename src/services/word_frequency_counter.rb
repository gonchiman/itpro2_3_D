class WordFrequencyCounter
    # @param [Hash]
    # @return [Hash{String => Integer}]
    def self.count_word_frequency(text_file)
        return {} if text_file.nil?

        text = _read_file(text_file)
        split_words = text.split(/[^A-Za-z]+/).reject(&:empty?)
        return _get_word_freqs(split_words)
    end

    # @param [Hash]
    # @return [String]
    def self._read_file(text_file)
        text = text_file[:tempfile].read
        lower_text = text.downcase
    end

    # @param [Array]
    # @return [Hash]
    def self._get_word_freqs(words)
        word_freqs = {} # {word: freq}

        for word in words
            if word_freqs.key?(word)
                word_freqs[word] += 1
            else
                word_freqs[word] = 1
            end
        end

        word_freqs
    end
end