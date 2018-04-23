require_relative('../db/sql_runner')

class Album

#getters
  attr_reader( :name, :stock_level, :artist_id, :id)

#initialize
  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @stock_level = options["stock_level"].to_i
    @artist_id = options["artist_id"].to_i
  end


#save method
  def save()
    sql = "INSERT INTO albums (name, stock_level, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @stock_level, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()["id"].to_i
  end
#update method
  def update()
    sql = "UPDATE albums SET (name, stock_level, artist_id) = ($1, $2, $3)
    WHERE id = $4"
    values = [@name, @stock_level, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

#delete method
  def delete()
    sql = "DELETE * FROM albums"
    SqlRunner.run(sql)
  end

#delete_all method
  def self.delete_all
    sql = "SELECT * FROM albums"
    SqlRunner.run(sql)
  end

#all method
  def self.all()
    sql = "SELECT * FROM albums"
    results = SqlRunner.run(sql)
    return results.map { |album| Album.new(album)}
  end


#find by id method
  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Album.new(results.first)
  end


#show quantity of stock
  def stock_level()
    sql = "SELECT stock_level FROM albums WHERE stock_level = $2"
    values = [stock_level]
    results = SqlRunner.run(sql, values)
    return Album.new(results.first)
  end



end
