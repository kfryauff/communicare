class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :notes
  
  def recent_private_notes
    private_notes.limit(5)
  end
  
  def private_notes
    notes_by_category(:private)
  end
  
  def public_notes
    notes_by_category(:public)
  end
  
  private
  def notes_by_category category
    notes.where(category: Note.categories[category]).order(desc: :created_at)
  end
end
