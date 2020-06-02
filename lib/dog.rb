class Dog
  attr_accessor :name, :breed
  attr_reader   :id 

  def initialize(id=nil,name:,breed:)
    @id = id
    @name = name
    @breed = breed
  end

  def self.create_table
    self.drop_table
    sql = <<-SQL
    create table dogs
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
end
