class AddMoodCountsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :good_mood_count, :integer, default: 0
    add_column :students, :neutral_mood_count, :integer, default: 0
    add_column :students, :bad_mood_count, :integer, default: 0
  end
end
