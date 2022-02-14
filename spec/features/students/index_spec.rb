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
    @student_3 = @professor_2.students.create!(name: "Fred Weasley",
                                              age:16,
                                              house: "Griffendor")

    ProfessorStudent.create!(professor_id: @professor_2.id, student_id: @student_2.id)
  end

  it "has a list of all student names and a count of professors each student has" do
    visit "/students"
    
    expect(page).to have_content("Ron Weasley: 2")
    expect(page).to have_content("Draco Malfoy: 1")
    expect(page).to have_content("Fred Weasley: 1")
  end

end
