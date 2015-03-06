class Note < ActiveRecord::Base
  enum privacy_status: [:private_, :public_]
  enum resolution: [:unresolved, :resolved]
  enum importance: [:low, :med, :high]
  enum mood: [:bad, :neutral, :good, :na]
  
  belongs_to :student
  belongs_to :user
end
