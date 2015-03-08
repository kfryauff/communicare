class Student < ActiveRecord::Base
  has_many :notes
  
  def full_name
    "#{given_name} #{surname}"
  end
  
  def public_notes
    unresolved_notes(:public_)
  end
  
  def private_notes conditions = {}
    unresolved_notes(:private_).where(conditions)
  end
  
  private
  
  def unresolved_notes privacy_status
    notes.where(resolution: Note.resolutions[:unresolved],
      privacy_status: Note.privacy_statuses[privacy_status])
  end
end
