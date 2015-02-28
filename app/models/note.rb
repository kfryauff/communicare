class Note < ActiveRecord::Base
  enum category: [:overview, :detail]
  belongs_to :student
end
