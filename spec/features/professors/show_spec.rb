require 'rails_helper'

RSpec.describe "professors show page" do
  before(:each) do
    @professor_1 = Professor.create!(name: "Minerva McGonagall",
                                    age: 204,
                                    specialty: "Transfiguration")
    @professor_2 = Professor.create!(name: "Remus Lupin",
                                    age: 54,
                                    specialty: "Defense")
    @student_1 = @professor_1.students.create!(name: "Draco Malfoy",
                                              age:14,
                                              house: "Slitheryn")
    @student_2 = @professor_1.students.create!(name: "Ron Weasley",
                                              age:14,
                                              house: "Griffendor")
    @student_3 = @professor_1.students.create!(name: "Fred Weasley",
                                              age:16,
                                              house: "Griffendor")

    ProfessorStudent.create!(professor_id: @professor_2.id, student_id: @student_3.id)
  end

  it "lists names of all students that that professor has" do
    visit "/professors/#{@professor_1.id}"

    expect(page).to have_content("Draco Malfoy")
    expect(page).to have_content("Ron Weasley")
    expect(page).to_not have_content("Fred Weasley")
  end
end
