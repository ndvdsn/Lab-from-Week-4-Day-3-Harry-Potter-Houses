require_relative('../models/students')
require_relative('../models/houses')

require('pry')

House.delete_all()
Student.delete_all()



house1 = House.new({
  "house_name" => "Gryffindor",
  "URL" => "x"
  })

house2 = House.new({
  "house_name" => "Slytherin",
  "URL" => "y"
  })

house3 = House.new({
  "house_name" => "Hufflepuff",
  "URL" => "z"
  })

house4 = House.new({
  "house_name" => "Ravenclaw",
  "URL" => "zz"
  })

house1.save()
house2.save()
house3.save()
house4.save()

student1 = Student.new({

  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_id" => house1.id,
  "age" => 11
  })

student2 = Student.new({

  "first_name" => "Hermione",
  "last_name" => "Granger",
  "house_id" => house1.id,
  "age" => 11
  })

student3 = Student.new({

  "first_name" => "Draco",
  "last_name" => "Malfoy",
  "house_id" => house2.id,
  "age" => 12
  })

student1.save()
student2.save()
student3.save()







binding.pry
nil
