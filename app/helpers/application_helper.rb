module ApplicationHelper
  def logout_link
    button_to 'Logout', destroy_user_session_path, method: :delete,
      form_class: "clearfix", form: { id: "logout-link" },
      class: "btn-link pull-right"
  end
  
  def url_with_query url, query
    url + (url.include?('?') ? '&' : '?') + query
  end
end
