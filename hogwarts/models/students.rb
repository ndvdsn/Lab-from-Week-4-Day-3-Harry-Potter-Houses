require_relative('../db/sql_runner')

class Student


attr_reader :first_name, :last_name, :house_id, :age, :id

def initialize(options)
  @id = options["id"].to_i
  @first_name = options["first_name"]
  @last_name = options["last_name"]
  @house_id = options["house_id"].to_i
  @age = options["age"].to_i
end

def save
  sql = "INSERT INTO students (first_name, last_name, house_id, age) VALUES ($1, $2, $3, $4) RETURNING *"
  values = [@first_name, @last_name, @house_id, @age]
  student_data = SqlRunner.run(sql, values)
  @id = student_data.first()["id"].to_i
end

def find_house
  sql = "SELECT * FROM houses where id = $1"
  values = [@house_id]
  result = SqlRunner.run(sql, values)
  return result[0]
end

def self.find_by_id(id)
  sql = "SELECT * FROM students WHERE id = $1"
  values = [id]
  student = SqlRunner.run(sql, values)
  result = Student.new(student.first)
  return result
end


def self.delete_all()
  sql = "DELETE FROM students"
  SqlRunner.run(sql)
end

def self.all()
  sql = "SELECT * FROM students"
  students = SqlRunner.run(sql)
  result = students.map{|student_hash|Student.new(student_hash)}
  return result
end



end
