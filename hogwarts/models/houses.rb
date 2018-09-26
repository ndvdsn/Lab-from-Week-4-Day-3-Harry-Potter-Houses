require_relative('../db/sql_runner')

class House


attr_reader :house_name, :URL, :id

def initialize(options)
  @id = options["id"].to_i
  @house_name = options["house_name"]
  @URL = options["URL"]
end

def save
  sql = "INSERT INTO houses (house_name, URL) VALUES ($1, $2) RETURNING *"
  values = [@house_name, @URL]
  house_data = SqlRunner.run(sql, values)
  @id = house_data.first["id"].to_i
end


def self.find_by_id(id)
  sql = "SELECT * FROM houses WHERE id = $1"
  values = [id]
  house = SqlRunner.run(sql, values)
  result = House.new(house.first)
  return result
end


def self.delete_all()
  sql = "DELETE FROM houses"
  SqlRunner.run(sql)
end

def self.all()
  sql = "SELECT * FROM houses"
  houses = SqlRunner.run(sql)
  result = houses.map{|house_hash|House.new(house_hash)}
  return result
end






end
