class Dog
  attr_accessor :name, :breed
  attr_reader   :id

  def initialize(id:nil,name:,breed:)
    @id = id
    @name = name
    @breed = breed
  end

  def self.create_table
    sql = <<-SQL
    create table if not exists dogs
    (id INTEGER PRIMARY KEY,
    name TEXT,breed TEXT)
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
    drop table
    dogs
    SQL
    DB[:conn].execute(sql)
  end

  def self.new_from_db(row)
    dog = Dog.new(row[0],row[1],row[2])
    dog
  end

  def save
    sql = <<-SQL
      INSERT INTO dogs (name, breed)
      VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.breed)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    self
  end

  def self.create(name:, breed:)
    dog = Dog.new(name,breed)
    dog.save
    dog
  end


end
