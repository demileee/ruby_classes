class Vampire
  @@coven = []

  def initialize(name, age)
    @name = name
    @age = age
    @drank_blood_today = false
    @in_coffin = false
  end

  def drank_blood_today
    return @drank_blood_today
  end

  def in_coffin
    return @in_coffin
  end

  def self.create(name, age)
    account = Vampire.new(name, age)
    @@coven << account
    return account
  end

  def drink_blood
    @drank_blood_today = true
  end

  def self.sunrise
    @@coven.each do |vamp|
      if vamp.in_coffin == false || vamp.drank_blood_today == false
        @@coven.delete(vamp)
      end
    end
  end

  def self.sunset
    @@coven.each do |vamp|
      @in_coffin = false
      @drank_blood_today = false
    end
  end

  def go_home
    @in_coffin = true
  end

  def self.coven
    return @@coven
  end

end

betty = Vampire.create("Betty", 250)
veronica = Vampire.create("Veronica", 300)
betty.inspect
betty.drink_blood
betty.go_home
Vampire.sunrise
puts "AFTER SUNRISE"
puts Vampire.coven.inspect
