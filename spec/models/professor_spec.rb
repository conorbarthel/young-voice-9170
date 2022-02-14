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

  before(:each) do
    @professor_2 = Professor.create!(name: "Remus Lupin",
                                    age: 54,
                                    specialty: "Defense")
    @professor_1 = Professor.create!(name: "Minerva McGonagall",
                                    age: 204,
                                    specialty: "Transfiguration")
    @student_1 = @professor_1.students.create!(name: "Draco Malfoy",
                                              age:15,
                                              house: "Slitheryn")
    @student_2 = @professor_1.students.create!(name: "Ron Weasley",
                                              age:14,
                                              house: "Griffendor")
  end

  describe 'instance methods' do
    describe '#average_student_age' do
      it "calculates a professors average student age" do

        expect(@professor_1.average_student_age).to eq(14.5)
      end
    end
  end
  describe 'class methods' do
    describe '#sort_by_name' do
      it "sorts professors by name" do
        expect(Professor.sort_by_name).to eq([@professor_1, @professor_2])
      end
    end
  end
end
