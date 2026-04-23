require "sinatra"
require_relative "src/services/word_frequency_counter"
require_relative "src/services/sort_frequency_service"
require_relative "src/services/frequency_distribution_service"
require_relative "src/constants/sort_types"

set :views, File.join(__dir__, "src", "views")
set :public_folder, File.join(__dir__, "src", "public")

get "/" do
    @word_freqs = {}
    @frequency_distribution = {}
    @sort_type = SortType::ALPHABET_ASC
    erb :word_frequency_count_page
end

post "/word_frequency_counter" do
    text_file = params[:text_file]
    sort_type = params[:sort_type]
    word_freqs = WordFrequencyCounter.count_word_frequency(text_file)

    @word_freqs =
        case sort_type
        when  SortType::ALPHABET_ASC
            SortFrequencyService.sort_by_alphabet_asc(word_freqs)
        when  SortType::ALPHABET_DESC
            SortFrequencyService.sort_by_alphabet_desc(word_freqs)
        when  SortType::FREQUENCY_ASC
            SortFrequencyService.sort_by_frequency_asc(word_freqs)
        when  SortType::FREQUENCY_DESC
            SortFrequencyService.sort_by_frequency_desc(word_freqs)
        else
            word_freqs.to_a
        end
    @sort_type = sort_type
    @frequency_distribution = FrequencyDistributionService.build(word_freqs)

    erb :word_frequency_count_page
end