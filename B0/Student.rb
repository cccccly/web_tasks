class Student
  def initialize(id, name, gender, age)
    @stu_id = id
    @stu_name = name
    @stu_gender = gender
    @stu_age = age
  end
  def display_details()
    puts "id :  #@stu_id"
    puts "name : #@stu_name"
    puts "gender : #@stu_gender"
    puts "age : #@stu_age"
  end
end

def random_name()
  chars = ("a".."z").to_a
  random_name = ""
  1.upto(rand(3..10)){|i| random_name << chars[rand(chars.size - 1)]}
  return random_name
end

def random_gender()
  gender = rand(1..2)
  if gender == 1
    random_gender = "man"
  else
    random_gender = "woman"
  end
  return random_gender
end

id = (1..100)
stu = Array.new(101)
id.each do |e|
  stu[e] = Student. new(e, random_name, random_gender ,rand(18..40))
  stu[e].display_details()
  puts
end
