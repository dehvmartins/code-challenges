require 'rails_helper'

feature "Searching" do

  scenario "show message if definitions are not found" do
    expect(Search).to receive(:definitions_from_api)
    visit root_path
    fill_in "word", with: "123456"
    click_on "Search"
    expect(page).to have_content("No matches found")
  end

  scenario "show definitions from database" do
    word = FactoryGirl.create(:word, content: "apple")
    definition = FactoryGirl.create(:definition, word: word)
    visit root_path
    fill_in "word", with: "apple"
    click_on "Search"
    expect(find('ul')).to have_selector('li', count: 1)
    expect(page).to have_content(definition.content.capitalize)
  end

  scenario "show definitions from api and create objects on database" do
    expect(Search).to receive(:definitions_from_api).and_return(["fruit"])
    visit root_path
    fill_in "word", with: "apple"
    expect { click_on "Search" }.to change(Word, :count).by(1)
                                .and change(Definition, :count).by(1)
    expect(find('ul')).to have_selector('li', count: 1)
    expect(page).to have_content("Fruit")
  end
end
