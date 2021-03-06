require_relative('../db/sql_runner')

class Artist
  attr_reader :id, :name

  def initialize( options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

  #save method
  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()["id"].to_i
  end

  def update()
    sql = "UPDATE artists SET (name) = ($1) WHERE id = $2"
    values = [@name]
    results = SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete(name)
    sql = "DELETE FROM artists WHERE name = $1"
    values = [name]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "SELECT * FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    results = SqlRunner.run(sql)
    return results.map { |artist| Artist.new(artist)}
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    artist_data = SqlRunner.run(sql, values)
    return Artist.new(artist_data.first)
  end

    def album()
      sql = "SELECT * FROM albums
      WHERE id = $1"
      values = [@id]
      results = SqlRunner.run(sql, values)
      return results.map { |album| Album.new(album)}
      #find artist for this album and create a new artist object
      #map .first
    end

end
