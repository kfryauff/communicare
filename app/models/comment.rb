class Comment < ActiveRecord::Base
  enum status: [:unresolved, :resolved]
  enum category: [:private, :public]
  belongs_to :student
end
