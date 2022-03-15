class CAT

    @@all = []

    attr_reader :name, :breed, :age

    def initialize(name, breed, age)
        @name = name
        @breed = breed
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def save(database_connection)
        database_connection.execute("INSERT INTO cats (name, breed, age) VALUES (?, ?, ?)"), self.name, self.breed, self.age)
    end
end

database_connection = SQLite3::Database.new('db/pets.db')

Cat.new("Maru", "scottish fold", 3)
Cat.new("Hana", "tortoiseshell", 1)

Cat.all.each do |cat|
    cat.save(database_connection)
end