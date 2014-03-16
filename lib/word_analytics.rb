class WordAnalytics

  attr_reader :entry

  def initialize(string)
    @entry = string.downcase
  end

  def word_count(word=nil)
    words_only = entry.scan(/[a-z]+/)
    words_by_count = {}
    words_only.each do |word|
      words_by_count.merge!({ word => words_only.count(word)})
    end
    return words_by_count if word == nil
    words_by_count[word.to_s]
  end

  def letter_count(letter=nil)
    letters_only = entry.scan(/[a-z]/)
    letters_by_count = {}
    letters_only.each do |letter|
      letters_by_count.merge!({letter => letters_only.count(letter)})
    end
    return letters_by_count if letter == nil
    letters_by_count[letter.to_s]
  end

  def symbol_count(symbol=nil)
    symbols_only = entry.scan(/[^a-zA-Z]\s|[^a-zA-Z]\z/)
    symbols_by_count = {}
    symbols_only.each do |symbol|
      symbols_by_count.merge!({symbol.rstrip => symbols_only.count(symbol)})
    end
    return symbols_by_count if symbol == nil
    symbols_by_count[symbol.to_s]
  end

  def three_most_common_words
    three_words = {}
    word_count.sort_by { |word, freq| freq }.last(3).each do |arr|
      three_words.merge!({arr[0] => arr[1]})
    end
    three_words
  end

  def three_most_common_letters
    three_letters = {}
    letter_count.sort_by { |letter, freq| freq }.last(3).each do |arr|
      three_letters.merge!({arr[0] => arr[1]})
    end
    three_letters
  end

  def one_time_word_count
    one_timers = word_count.values.select {|x| x == 1}
    one_timers.count
  end

  def unused_letters
    unused_letters = []
    ('a'..'z').to_a.each do |x|
      unless letter_count.keys.include?(x)
        unused_letters << x
      end
    end
    unused_letters
  end
end
