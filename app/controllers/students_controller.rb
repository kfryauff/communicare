class StudentsController < ApplicationController
  def index
    # puts "**** \n"
    # puts current_user.students()
    # puts "**** \n"
    sort_by = params[:sort] || :given_name
    self.students = Student.order(sort_by)
  end
  
  def new
    self.student = Student.new
  end
  
  def create
    Student.create!(student_params) do |s|
      s.image = upload(params[:student][:image])
    end
    
    redirect_to students_path
  end
  
  def show
    self.student = Student.find(params[:id])
  end
  
  def new_note
    sort_by = params[:sort] || :given_name
    self.students = Student.order(sort_by)
  end
  
  private
  helper_attr :students, :student
  
  def student_params
    params.require(:student).permit(:given_name, :surname, :age, :joined_at)
  end
  
  def upload uploaded_io
    filename = Rails.root.join('app', 'assets', 'images', 'uploads', uploaded_io.original_filename)
    File.open(filename, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    
    "uploads/#{uploaded_io.original_filename}"
  end
end
