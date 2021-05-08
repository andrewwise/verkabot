class MentionWords

  def initialize
    @used_words = Array.new
  end

  def prep_words(word)
    words = Array.new

    words << word
    words << word.upcase
    words << word.downcase
    words << word.capitalize

    @used_words += words
    
    return words
  end

  def used_words
    return @used_words
  end

end