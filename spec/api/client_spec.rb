require 'rails_helper'

describe DictionaryApi::Client, :vcr => true do
  it 'returns a xml of definitions' do
    client = DictionaryApi::Client.new
    response = client.definitions("world")

    expect(response.body).to include("<entry id=\"world[1]\">")
    expect(response.code).to be(200)
  end
end
