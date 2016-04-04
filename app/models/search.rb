class Search

  def self.definitions word
    definitions_from_database(word) || definitions_from_api(word)
  end

  def self.definitions_from_api(word)
    client = DictionaryApi::Client.new
    DictionaryApi::Parser.parse(client.definitions(word))
  end

  def self.definitions_from_database(word)
    Word.find_by(content: word).definitions.pluck(:content) if Word.exists?(content: word)
  end
end
