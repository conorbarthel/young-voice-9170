require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:professors).through(:professor_students)}
  end

  describe 'class methods' do
    before(:each) do
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

    describe '#sort_students_by_name' do
      it "sorts by name" do
        expect(Student.sort_students_by_name).to eq([@student_1, @student_2])
      end
    end
  end
end
