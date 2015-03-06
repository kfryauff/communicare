class NotesController < ApplicationController
  def new
    self.student = Student.find(params[:student_id])
    self.note = student.notes.build
  end
  
  def create
    student = Student.find(params[:student_id])
    #student.notes.create!(note_params) do |n|
    #  n.user = current_user
    #end
    
    redirect_to student
  end
  
  def status
    note = Note.find(params[:id])
    note.resolved!
    
    redirect_to :back
  end
  
  private
  helper_attr :note, :student
  
  def note_params
    params.require(:note).permit
  end
end
