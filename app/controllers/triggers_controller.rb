class TriggersController < ApplicationController
  def index
    self.triggers = Trigger.group_by_topic_and_percent_student
  end
  
  def new
    self.student = Student.find(params[:student_id])
    self.trigger = student.triggers.build
  end
  
  def create
    student = Student.find(params[:student_id])
    student.triggers.create!(trigger_params)
    
    redirect_to edit_student_triggers_path(student)
  end
  
  def edit
    self.student = Student.find(params[:student_id])
  end
  
  def update
    trigger = Trigger.find(params[:id])
    trigger.update!(trigger_params)
    
    redirect_to edit_student_triggers_path(trigger.student)
  end
  
  private
  helper_attr :triggers, :trigger, :student
  
  def trigger_params
    params.require(:trigger).permit(:topic, :detail)
  end
end
