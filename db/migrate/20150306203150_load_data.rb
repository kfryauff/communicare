class LoadData < ActiveRecord::Migration
  def up
  	# initial fake kids
  	down
  	kid1 = Student.new(:given_name => "Lillybeth", :surname => "Serrano", :image => "uploads/kid1.png", :age => 12, :joined_at => "2012-08-30 12:34:23")
 	kid1.save()
 	kid2 = Student.new(:given_name => "Keagan", :surname => "Royce", :image => "uploads/kid2.png", :age => 11, :joined_at => "2012-09-27 01:14:23")
 	kid2.save()
 	kid3 = Student.new(:given_name => "Trace", :surname => "Kingsley", :image => "uploads/kid3.png", :age => 12, :joined_at => "2012-10-28 10:41:26")
 	kid3.save()
 	kid4 = Student.new(:given_name => "Raymond", :surname => "Skully", :image => "uploads/kid4.png", :age => 11, :joined_at => "2012-11-29 10:13:23")
 	kid4.save()
 	# kid5 = Student.new(:given_name => "Daren", :surname => "Demapan", :image => "uploads/kid5.png", :age => 12, :joined_at => "2012-12-29 10:44:23")
 	# kid5.save()
 	# kid6 = Student.new(:given_name => "Alejandro", :surname => "Hernandez", :image => "uploads/kid6.png", :age => 13, :joined_at => "2013-02-29 11:44:23")
 	# kid6.save()
 	# kid7 = Student.new(:given_name => "Aleah", :surname => "Lopez", :image => "uploads/kid7.png", :age => 11, :joined_at => "2013-01-29 10:34:23")
 	# kid7.save()
 	# kid8 = Student.new(:given_name => "Dominiq", :surname => "Sufre", :image => "uploads/kid8.png", :age => 11, :joined_at => "2012-11-29 10:22:12")
 	# kid8.save()
  end

  def down
  end
end
