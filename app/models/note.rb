class Note < ActiveRecord::Base
  enum category: [:one_on_one, :general, :observation]
  enum privacy_status: [:private_, :public_]
  enum resolution: [:unresolved, :resolved]
  enum importance: [:low, :med, :high]
  enum mood: [:bad, :neutral, :good, :na]
  
  belongs_to :student
  belongs_to :user
  
  validates_presence_of :category, :privacy_status, :resolution, :importance,
    :mood, :student, :user
  
  def self.good_mood_count
    mood_count(:good)
  end
  
  def self.neutral_mood_count
    mood_count(:neutral)
  end
  
  def self.bad_mood_count
    mood_count(:bad)
  end
  
  private
  
  def self.mood_count mood
    where(mood: moods[mood]).count
  end
end
