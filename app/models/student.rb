class Student < ActiveRecord::Base
  has_many :notes
  
  def full_name
    "#{given_name} #{surname}"
  end
end
