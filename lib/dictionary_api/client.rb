module DictionaryApi
  class Client
    require 'httparty'
    include HTTParty
    base_uri 'www.dictionaryapi.com'

    def api_key
      ENV['DICTIONARY_API_KEY']
    end

    def base_path
      "/api/v1/references/collegiate/xml/"
    end

    def build_url_from_options(word)
      if word
        "#{ base_path }#{ word }?key=#{ api_key }"
      else
        raise ArgumentError, "arguments must specify word to search"
      end
    end

    def definitions word
      self.class.get(build_url_from_options(word))
    end
  end
end
