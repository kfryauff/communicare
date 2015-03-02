class Student < ActiveRecord::Base
  has_many :triggers
  has_many :notes
  
  def full_name
    "#{given_name} #{surname}"
  end
  
  def overview_note
    notes.find_or_create_by!(category: Note.categories[:overview])
  end
  
  def detail_note
    notes.find_or_create_by!(category: Note.categories[:detail])
  end
end
