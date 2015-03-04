class Note < ActiveRecord::Base
  enum category: [:private_, :public_]
  enum status: [:unresolved, :resolved]
  
  belongs_to :student
  belongs_to :user
  
  def self.recent_public_notes
    where(category: Note.categories[:public_], status: Note.statuses[:unresolved])
      .order(created_at: :desc).limit(5)
  end
end
