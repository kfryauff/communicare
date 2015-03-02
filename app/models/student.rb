class Student < ActiveRecord::Base
  has_many :triggers
  has_many :notes
  has_many :comments
  
  def full_name
    "#{given_name} #{surname}"
  end
  
  def overview_note
    notes.find_by(category: Note.categories[:overview])
  end
  
  def detail_note
    notes.find_by(category: Note.categories[:detail])
  end
  
  def unresolved_private_comments
    comments.where(status: Comment.statuses[:unresolved],
      category: Comment.categories[:private])
  end
  
  def unresolved_public_comments
    comments.where(status: Comment.statuses[:unresolved],
      category: Comment.categories[:public])
  end
end
