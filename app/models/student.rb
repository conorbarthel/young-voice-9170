class Student <ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :house, presence: true

  has_many :professor_students
  has_many :professors, through: :professor_students


  def self.sort_students_by_name
    order(:name)
  end
end
