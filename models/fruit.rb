class Fruit

  def self.all
    db.execute('SELECT * FROM fruits')
  end

  def self.find_by_id(id)
    db.execute('SELECT * FROM fruits WHERE id = ?', id).first
  end

  def self.create(name, tastiness)
    db.execute('INSERT INTO fruits (name, tastiness) VALUES (?,?)', name, tastiness)
  end

  private 
  def self.db
    return @db if @db
    @db = SQLite3::Database.new('db/fruits.sqlite')
    @db.results_as_hash = true
    @db
  end

end