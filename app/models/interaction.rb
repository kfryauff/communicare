class Interaction < ActiveRecord::Base
  enum topic: [:casual, :problem, :follow_up, :other]
  belongs_to :student
end
