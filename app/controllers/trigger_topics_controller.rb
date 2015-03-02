class TriggerTopicsController < ApplicationController
  def show
    self.students = Student.joins(:triggers).where(triggers: { topic: params[:topic] })
  end
  
  private
  helper_attr :students
end
