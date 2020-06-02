class Dog
  attr_accessor :id, :name, :breed

  def initialize(id:,name:,breed:)
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
    DB[:conn].execute
  end
end
