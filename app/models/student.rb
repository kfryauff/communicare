class Student < ActiveRecord::Base
  def full_name
    "#{given_name} #{surname}"
  end
end
