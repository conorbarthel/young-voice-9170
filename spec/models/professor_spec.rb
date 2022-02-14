require 'rails_helper'

RSpec.describe Professor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :specialty}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:students).through(:professor_students)}
  end

  describe 'instance methods' do
    describe '#average_student_age' do
      it "calculates a professors average student age" do
        @professor_1 = Professor.create!(name: "Minerva McGonagall",
                                        age: 204,
                                        specialty: "Transfiguration")
        @student_1 = @professor_1.students.create!(name: "Draco Malfoy",
                                                  age:15,
                                                  house: "Slitheryn")
        @student_2 = @professor_1.students.create!(name: "Ron Weasley",
                                                  age:14,
                                                  house: "Griffendor")

        expect(@professor_1.average_student_age).to eq(14.5)
      end
    end
  end

end
