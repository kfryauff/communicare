class TriggerTopicsController < ApplicationController
  def show
    topic_val = Trigger.topics[params[:id]]
    self.students = Student.joins(:triggers).where(triggers: { topic: topic_val })
  end
  
  private
  helper_attr :students
end
