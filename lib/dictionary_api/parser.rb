module DictionaryApi
  class Parser

    def self.parse(xml)
      doc = Nokogiri::XML.parse(xml)
      result = doc.xpath("//def//dt").text.gsub(": as:", " as ").split(":").reject(&:empty?)
      result unless result.empty?
    end
  end
end
