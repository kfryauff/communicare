module NotesHelper
  def mood_percent_image mood, notes
    mood_name = t(mood, scope: [:activerecord, :attributes, :note, :moods])
    mood_percent = notes.send("#{mood}_mood_percent")
    image_tag "mood_#{mood}_trans.png", alt: "",
      title: "#{mood_name}: #{mood_percent}%", width: mood_percent,
      height: mood_percent
  end
end
