class BulkDictionary

  def self.populate word, definitions
    unless Word.exists?(content: word)
      word = Word.create(content: word)
      definitions.each {|definition| word.definitions.create(content: definition)}
    end
  end
end
