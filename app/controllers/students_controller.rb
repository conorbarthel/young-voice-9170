class StudentsController < ApplicationController
  def index
    @students = Student.sort_students_by_name
  end

end
