class NotesController < ApplicationController
  def new
    self.student = Student.find(params[:student_id])
    self.note = student.notes.build(category: Note.categories[:public_])
  end
  
  def create
    student = Student.find(params[:student_id])
    student.notes.create!(note_params) do |n|
      n.user = current_user
      n.status = :unresolved
    end
    
    redirect_to student
  end
  
  def index
    self.private_notes = current_user.private_notes
    self.public_notes = current_user.public_notes
  end
  
  def recent
    self.private_notes = current_user.recent_private_notes
    self.public_notes = Note.recent_public_notes
  end
  
  def status
    note = Note.find(params[:id])
    note.resolved!
    
    redirect_to :back
  end
  
  private
  helper_attr :note, :private_notes, :public_notes, :student
  
  def note_params
    params.require(:note).permit(:category, :text)
  end
end
