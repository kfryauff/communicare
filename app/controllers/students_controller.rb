class StudentsController < ApplicationController
  def index
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
    self.public_notes = student.public_notes.with_text
    self.private_notes = student.private_notes(user: current_user).with_text
    
    if params[:sort_by_creator]
      self.public_notes = public_notes.joins(:user).order("users.name ASC")
      self.private_notes = private_notes.joins(:user).order("users.name ASC")
    else
      if params[:sort_attr] && params[:sort_order]
        note_order = { params[:sort_attr] => params[:sort_order].to_sym }
      else
        note_order = { importance: :desc, created_at: :desc }
      end
      
      self.public_notes = public_notes.order(note_order)
      self.private_notes = private_notes.order(note_order)
    end
  end
  
  def new_note
    sort_by = params[:sort] || :given_name
    self.students = Student.order(sort_by)
  end
  
  private
  helper_attr :students, :student, :public_notes, :private_notes
  
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
