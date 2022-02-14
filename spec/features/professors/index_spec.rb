require 'rails_helper'

RSpec.describe "professors index page" do
  before(:each) do
    @professor_2 = Professor.create!(name: "Remus Lupin",
                                    age: 54,
                                    specialty: "Defense")
    @professor_1 = Professor.create!(name: "Minerva McGonagall",
                                    age: 204,
                                    specialty: "Transfiguration")
  end

  it "lists all professor's name alphabetically age and specialty" do
    visit "/professors"

    expect(page).to have_content("Name: Minerva McGonagall")
    expect(page).to have_content("Name: Remus Lupin")
    expect(page).to have_content("Age: 204")
    expect(page).to have_content("Age: 54")
    expect(page).to have_content("Specialty: Defense")
    expect("Name: Minerva McGonagall").to appear_before("Name: Remus Lupin")
  end
end
