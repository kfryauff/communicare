class Trigger < ActiveRecord::Base
  enum topic: [:family, :college, :appearance, :grades, :financial, :other]
  belongs_to :student
  
  def self.group_by_topic_and_percent_student
    total_students = Student.count.to_f
    
    topics.map do |topic, topic_val|
      num_students_with_trigger = Trigger.where(topic: topic_val).count(:student_id)
      percent_student = num_students_with_trigger / total_students * 100
      [topic, percent_student.to_i]
    end.sort {|x, y| y[1] <=> x[1] }
  end
  
  def self.topic_options
    topics.map do |topic, topic_val|
      [topic.humanize, topic]
    end
  end
end
