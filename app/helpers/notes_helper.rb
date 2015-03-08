module NotesHelper
  def mood_percent_image mood, mood_name, notes
    mood_percent = notes.send("#{mood}_mood_percent")
    image_tag "mood_#{mood}_trans.png", alt: "",
      title: "#{mood_name}: #{mood_percent}%", width: mood_percent,
      height: mood_percent
  end
end
