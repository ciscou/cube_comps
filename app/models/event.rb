class Event
  EVENTS = {
    "333"    => "Rubik's Cube",
    "444"    => "4x4 Cube",
    "555"    => "5x5 Cube",
    "222"    => "2x2 Cube",
    "333bf"  => "Rubik's Cube: Blindfolded",
    "333oh"  => "Rubik's Cube: One-handed",
    "333fm"  => "Rubik's Cube: Fewest moves",
    "333ft"  => "Rubik's Cube: With feet",
    "minx"   => "Megaminx",
    "pyram"  => "Pyraminx",
    "sq1"    => "Square-1",
    "clock"  => "Rubik's clock",
    "666"    => "6x6 Cube",
    "777"    => "7x7 Cube",
    "magic"  => "Rubik's Magic",
    "mmagic" => "Master Magic",
    "444bf"  => "4x4x4 Cube: Blindfolded",
    "555bf"  => "5x5x5 Cube: Blindfolded",
    "333mbf" => "Rubik's Cube: Multiple Blindfolded"
  }

  def initialize(code)
    @code = code
  end

  def self.all
    EVENTS.keys.map { |code| Event.new(code) }
  end

  attr_reader :code

  def name
    EVENTS[@code]
  end
end
