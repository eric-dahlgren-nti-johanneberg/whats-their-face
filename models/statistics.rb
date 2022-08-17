class Statistics

  def self.all
    db.execute('SELECT * FROM statistics')
  end

  def self.find_by_id(id)
    db.execute('SELECT * FROM statistics WHERE id = ?', id).first
  end

  def self.create(name, image)
    db.execute('INSERT INTO statistics (name, tastiness) VALUES (?,?)', name, tastiness)
  end

  private 
  def self.db
    return @db if @db
    @db = SQLite3::Database.new('db/statistics.sqlite')
    @db.results_as_hash = true
    @db
  end

end