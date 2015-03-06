class RemoveMoodCountsFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :good_mood_count, :integer
    remove_column :students, :neutral_mood_count, :integer
    remove_column :students, :bad_mood_count, :integer
  end
end
