PEOPLE_ARRAY = [
  'Luisa Lavens',
  'Jillian Bischoff',
  'Wittie Cronin',
  'Tamarah Disbrey',
  'Manolo Crighton',
  'Wileen Kubes',
  'Dwight Gitting',
  'Kellina Flowith',
  'Randy Daw',
  'Loree Dowber',
  'Leslie Kennifeck',
  'Jessica Enocksson',
  'Kirby Hanning',
  'Nissie Saket',
  'Ermanno Honatsch',
  'Ivie Bagniuk',
  'Berton Paynter',
  'Cooper Wolland'
].freeze.first(5)

class QuizDB
  # historik per användare
  # möjliga människor

  def self.get_people(amount, last)
    not_last = 'WHERE id != ?'
    suffix = 'ORDER BY RANDOM() LIMIT ?'
    alternatives = if last.nil?
                     db.execute("SELECT * FROM people #{suffix}", amount)
                   else
                     db.execute("SELECT * FROM people #{not_last} #{suffix}", last, amount)

                   end
    alternatives.map do |person|
      Person.new(person['name'], person['id'])
    end
  end

  def self.get_history(id)
    db.execute('SELECT * FROM history WHERE user_id = ?', id)
  end

  def self.guess(user_id, person_id, name)
    person = db.execute('SELECT name FROM people WHERE id = ?', person_id).first

    correct = person['name'] == name
    db.execute('INSERT INTO history (user_id, person_id, result, answer) VALUES (?, ?, ?, ?)', user_id, person_id,
               correct ? 1 : 0, name)

    correct
  end

  def self.find(person_id)
    person = db.execute('SELECT * FROM people WHERE id = ?', person_id).first
    p person
    p person_id

    Person.new(person["name"], person["id"])
    
  end

  def self.init!
    drop_tables!
    create_tables!
    populate_tables!
  end

  def self.drop_tables!
    db.execute('DROP TABLE IF EXISTS people')
    db.execute('DROP TABLE IF EXISTS history')
  end

  def self.create_tables!
    db.execute "CREATE TABLE people (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    name TEXT NOT NULL)"
    db.execute "CREATE TABLE history (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id TEXT,
        person_id INTEGER,
        result INTEGER,
        answer TEXT
    )"
  end

  def self.populate_tables!
    PEOPLE_ARRAY.each do |person|
      db.execute('INSERT INTO people (name) VALUES (?)', person)
    end
  end

  def self.db
    return @db if @db

    @db = SQLite3::Database.new('db/quiz.sqlite')
    @db.results_as_hash = true
    @db
  end
end
