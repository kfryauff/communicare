class StudentsController < ApplicationController
  def index
    self.students = Student.all
  end
  
  private
  attr_accessor :students
  helper_method :students
end
