require "sinatra"
require_relative "src/service/word_frequency_counter"

set :views, File.join(__dir__, "src", "views")
set :public_folder, File.join(__dir__, "src", "public")

get "/" do
    @word_freqs = {}
    erb :word_frequency_count_page
end

post "/word_frequency_counter" do
    text_file = params[:text_file]

    @word_freqs = WordFrequencyCounter.count_word_frequency(text_file)
    erb :word_frequency_count_page
end