require "cityhash"

class Colos
  # Convert string to color
  #
  # Example:
  #   >> Colos.color("word")
  #   => 395e9a
  #
  # Arguments:
  #   str: (String)
  def self.color str
    hash = CityHash.hash32 str
    frequency = 1.4
    (hash ** (1.0/frequency)).to_i.to_s 16
  end

  # Convert string to colors
  #
  # Example:
  #   >> Colos.colors("word")
  #   => ["b7d989", "395e9a", "14e8c0"]
  #
  # Arguments:
  #   str: (String)
  def self.colors str
    hash = CityHash.hash32 str
    colors = []
    for i in (12..16) do
      frequency = i / 10.0
      q = (hash ** (1.0/frequency)).to_i
      colors << q.to_s(16) if q.to_s(16).size == 6
    end
    colors
  end

end
