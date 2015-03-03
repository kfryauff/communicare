class Student < ActiveRecord::Base
  has_many :notes
  
  def full_name
    "#{given_name} #{surname}"
  end
  
  def unresolved_private_notes
    unresolved_notes(:private)
  end
  
  def unresolved_public_notes
    unresolved_notes(:public)
  end
  
  private
  def unresolved_notes category
    notes
      .where(status: Note.statuses[:unresolved], category: Note.categories[category])
      .order(desc: :created_at)
  end
end
