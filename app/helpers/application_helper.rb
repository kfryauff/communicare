module ApplicationHelper
  def logout_link
    button_to 'Logout', destroy_user_session_path, method: :delete,
      form_class: "clearfix", form: { id: "logout-link" },
      class: "btn-link pull-right"
  end
  
  def url_with_query url, query
    url + (url.include?('?') ? '&' : '?') + query
  end
  
  def navbar_menuitems
    [["Home", students_path],
      ["Create new note", new_note_students_path],
      ["Add students to your home", "#"],
      ["Remove students from your home", "#"],
      ["Create a new student profile", new_student_path],
      ["Delete a student profile", "#"]]
  end
end
