class NotesController < ApplicationController
  def edit
    self.note = Note.find(params[:id])
  end
  
  def update
    note = Note.find(params[:id])
    note.update!(note_params)
    
    redirect_to note.student
  end
  
  private
  helper_attr :note
  
  def note_params
    params.require(:note).permit(:text)
  end
end
