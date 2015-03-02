class StudentsController < ApplicationController
  def index
    sort_by = params[:sort] || :given_name
    self.students = Student.order(sort_by)
  end
  
  def new
    self.student = Student.new
  end
  
  def create
    Student.create!(student_params)
    redirect_to students_path
  end
  
  def show
    self.student = Student.find(params[:id])
  end
  
  def p1
    self.student = Student.find(params[:id])
  end
  
  def p2
    self.student = Student.find(params[:id])
  end
  
  def p3
    self.student = Student.find(params[:id])
  end
  
  private
  helper_attr :students, :student
  
  def student_params
    params.require(:student).permit(:given_name, :surname, :image, :age, :joined_at)
  end
end
