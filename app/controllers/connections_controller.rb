class ConnectionsController < ApplicationController
  def index
    sort_by = params[:sort] || :given_name
    self.students = current_user.students.order(sort_by)
  end
  
  def new
    sort_by = params[:sort] || :given_name
    self.students = Student.except_for_user(current_user).order(sort_by)
  end
  
  def delete
    sort_by = params[:sort] || :given_name
    self.students = current_user.students.order(sort_by)
  end
  
  private
  helper_attr :students
end
