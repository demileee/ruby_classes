class Zombie
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def initialize(speed, strength)
    if speed > @@max_speed
      @speed = @@default_speed
    else
      @speed = speed
    end

    if strength > @@max_strength
      @strength = @@default_strength
    else
      @strength = strength
    end
  end

  def speed
    return @speed
  end

  def strength
    return @strength
  end

  def encounter
    if outrun_zombie? && survive_attack?
      puts "You escaped!"
    elsif outrun_zombie? == false && survive_attack? == true
      @@horde << Zombie.new((rand(@@max_speed)+1), (rand(@@max_strength)+1))
      puts "You managed to escape but you turned into... ONE OF THEM!"
    elsif survive_attack? == false
      puts "Boohoo, you're D-E-A-D."
    end
  end

  def outrun_zombie?
    if (rand(@@max_speed)+1) > self.speed
      return true
    else
      return false
    end
  end

  def survive_attack?
    if (rand(@@max_strength)+1) > self.strength
      return true
    else
      return false
    end
  end

  def self.all
    return @@horde
  end

  def self.new_day
    some_die_off
    spawn
    increase_plague_level
  end

  def self.some_die_off
    (rand(10)+1).times do
      @@horde.delete_at(0)
    end
  end

  def self.spawn
    (rand(@@plague_level)+1).times do
      @@horde << Zombie.new((rand(@@max_speed)+1), (rand(@@max_strength)+1))
    end
  end

  def self.increase_plague_level
    @@plague_level += rand(3)
  end
end

puts Zombie.all.inspect # []
Zombie.new_day.inspect
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died
