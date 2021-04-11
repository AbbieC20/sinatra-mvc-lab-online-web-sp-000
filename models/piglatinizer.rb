class PigLatinizer
  attr_reader :text

  def initialize(text)
    @text = text
    text_split
  end

  def text_split
    @words = @text.split(" ")
  end


  def processor
    processed_words = []
    @words.each do |word|
      if word.start_with?("a","e","i","o","u","y")
        processed_words << "#{word}way"
      else
        until word.start_with?("a","e","i","o","u","y")
          first_character = word[0]
          word.slice!(0)
          word = "#{word}#{first_character}"
        end
        processed_words << "#{word}ay"
      end
    end
    processed_words.join(" ")
  end

end
