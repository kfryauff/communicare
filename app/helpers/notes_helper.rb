module NotesHelper
  def mood_percent_image mood, mood_name, notes
    mood_percent = notes.send("#{mood}_mood_percent")
    image_tag "mood_#{mood}_trans.png", alt: "",
      title: "#{mood_name}: #{mood_percent}%", width: mood_percent,
      height: mood_percent
  end

  def mood_count_data mood, mood_name, notes
  	mood_count = notes.send("#{mood}_mood_count")
  end

  
  def importance_color importance
    case importance
    when "low" then "info"
    when "med" then "warning"
    when "high" then "danger"
    end
  end
end
