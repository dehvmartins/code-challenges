require 'rails_helper'

RSpec.describe DictionaryApi::Parser do
  let(:parser) { DictionaryApi::Parser}
  let(:xml) {'<?xml version="1.0" encoding="UTF-8"?>
              <entry>
                <def>
                  <dt>:the earthly state of human existence</dt>
                  <dt>:life after death used with a qualifier the next</dt>
                  <dt>:the earth with its inhabitants and all things upon it</dt>
                </def>
              </entry>'
           }

  describe "#parse" do
    it "returns nil when there isn't definitions on xml" do
      response = parser.parse("")
      expect(response).to be_nil
    end

    it "returns array with definitions found on xml" do
      response = parser.parse(xml)
      expect(response).not_to be_nil
      expect(response).to be_instance_of(Array)
      expect(response.count).to eq(3)
    end
  end

end
