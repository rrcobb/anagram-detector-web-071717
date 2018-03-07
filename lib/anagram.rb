class Anagram
  attr_accessor :word

  def initialize(word)
    @word = word
    @character_count = self.class.count_characters(word)
  end

  # counts the characters in the string
  # input: string
  # output: hash of character => count (int)
  def self.count_characters(string)
    string
    .chars
    .group_by { |c| c }
    .reduce({}) do |memo, (char, arr)|
       memo[char] = arr.length
       memo
     end
  end

  def match(words)
    words.select { |possible_anagram| self.anagram?(possible_anagram) }
  end

  def length_matches(string)
    string.length == self.word.length
  end

  def character_count_matches(string)
    # will hash equality work here??
    @character_count == self.class.count_characters(string)
  end
  # How to detect an anagram?
  # anagrams have the same number of the same characters
  # so, we could count each character, then check if the character counts are the same!
  # (and take some shortcuts like checking that the lengths are the same, etc)
  def anagram?(string)
    length_matches(string) && character_count_matches(string)
  end
end
