class Note < ActiveRecord::Base
  enum privacy_status: [:private_, :public_]
  enum resolution: [:unresolved, :resolved]
  enum importance: [:low, :med, :high]
  enum mood: [:bad, :neutral, :good, :na]
  
  belongs_to :student
  belongs_to :user
  
  def self.recent_public_notes
    where(category: Note.categories[:public_], status: Note.statuses[:unresolved])
      .order(created_at: :desc).limit(5)
  end
end
