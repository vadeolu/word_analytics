require 'rspec'
require_relative '../lib/word_analytics'

describe WordAnalytics do

  let (:fact) {"Question: How much wood would a woodchuck chuck if " +
    "a woodchuck could chuck wood? Answer: A woodchuck would " +
    "chuck as much wood as a woodchuck could " +
    "chuck if a woodchuck could chuck wood."}

  let (:woodchuck) {WordAnalytics.new(fact)}

  it 'counts the number of each word' do
    expect(woodchuck.word_count("wood")).to eq(4)
    expect(woodchuck.word_count("jello")).to eq(nil)
  end

  it 'counts the number of each letter' do
    expect(woodchuck.letter_count("q")).to eq(1)
    expect(woodchuck.letter_count("o")).to eq(25)
  end

  it 'counts the number of each symbol' do
    expect(woodchuck.symbol_count("?")).to eq(1)
    expect(woodchuck.symbol_count(":")).to eq(2)
  end

  it 'returns the three most common words' do
    common_words = {"chuck"=>5, "a"=>5, "woodchuck"=>5}
    expect(woodchuck.three_most_common_words).to eq(common_words)
  end

  it 'returns the three most common letters' do
    common_letters = {"u"=>18, "c"=>25, "o"=>25}
    expect(woodchuck.three_most_common_letters).to eq(common_letters)
  end

  it 'returns the number of words used only once' do
    expect(woodchuck.one_time_word_count).to eq(3)
  end

  it 'returns all letters not used in the string' do
    unused = ["b", "g", "j", "p", "v", "x", "y", "z"]
    expect(woodchuck.unused_letters).to eq(unused)
  end

end


