class Note < ActiveRecord::Base
  enum category: [:private, :public]
  enum status: [:unresolved, :resolved]
  
  belongs_to :student
  belongs_to :user
  
  def self.recent_public_notes
    where(category: Note.categories[:public]).order(desc: :created_at).limit(5)
  end
end
