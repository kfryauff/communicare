class Trigger < ActiveRecord::Base
  enum topic: [:family, :college, :appearance, :grades, :financial, :other]
  belongs_to :student
end
