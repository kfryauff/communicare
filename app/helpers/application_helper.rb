module ApplicationHelper
  def logout_link
    button_to 'Logout', destroy_user_session_path, method: :delete,
      form_class: "clearfix", form: { id: "logout-link" },
      class: "btn-link pull-left"
  end
  
  def url_with_query url, query = nil
    if query.nil?
      query = url
      url = request.path_info
    end
    
    query_string = query.reduce("") do |accum, obj|
      name, val = obj
      "#{accum}&#{name}=#{val}"
    end
    
    url + (url.include?('?') ? '&' : '?') + query_string[1..-1]
  end
  
  def navbar_menuitems
    [["Home", students_path],
      # ["Create new note", new_note_students_path],
      ["Add students to your home", "#"],
      ["Remove students from your home", "#"],
      ["Create a new student profile", new_student_path],
      # ["Delete a student profile", "#"]]
      # ["Logout", ]
    ]
  end
end
