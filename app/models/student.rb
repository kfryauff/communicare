class Student < ActiveRecord::Base
  has_many :notes
  
  def full_name
    "#{given_name} #{surname}"
  end
  
  def private_notes conditions = {}
    unresolved_notes(:private_, conditions)
  end
  
  def public_notes
    unresolved_notes(:public_)
  end
  
  private
  def unresolved_notes category, conditions = {}
    notes
      .where(status: Note.statuses[:unresolved], category: Note.categories[category])
      .where(conditions)
      .order(created_at: :desc)
  end
end
