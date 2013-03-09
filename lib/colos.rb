require "cityhash"

class Colos
  
  # Options store
  attr_accessor :options

  # Initializer
  #
  # Example:
  #   >> Colos.new frequency: 1.2, randomizr: 12
  #   => Colos instance
  #
  # Arguments:
  #   options: (Hash)
  def initialize options = {}
    default_options = {
      hash: CityHash,
      frequency: 1.4,
      randomizr: 0
    }

    # merge
    @options = default_options.merge options

    # errors
    raise "Frequency option should be from 1.2 to 1.6" unless (1.2..1.6).include? @options[:frequency]
    raise "Randomizr option should be from 0 to 23" unless (0..23).include? @options[:randomizr]
    raise "Hash class should have `new` method" unless @options[:hash].respond_to?('hash32')
  end

  # Convert IPv4 to color
  #
  # Example:
  #   >> Colos.ip '173.194.32.14'
  #   => "395e9a"
  #
  # Arguments:
  #   str: (String)
  def ip str
    ip = str.split '.'
    hex = ""

    raise "Invalid IP" unless ip.size == 4

    rgb = ip.permutation(3).to_a[@options[:randomizr]].map &:to_i

    rgb.each do |b|
      b = b.to_s 16
      b = "0#{b}" unless b.size == 2
      hex += b
    end

    hex
  end

  # Convert IPv4 to colors
  #
  # Example:
  #   >> Colos.ips '173.194.32.14'
  #   => ["adc220", ..., "ee20c2"]
  #
  # Arguments:
  #   str: (String)
  def ips str
    ip = str.split '.'
    hexs = []

    raise "Invalid IP" unless ip.size == 4

    ip.permutation(3).to_a.each do |color|
      hex = ""
      color.each do |b|
        b = b.to_i.to_s 16
        b *= 2 unless b.size == 2
        hex += b
      end
      hexs << hex
    end

    hexs
  end

  # Convert string to color
  #
  # Example:
  #   >> Colos.color("word")
  #   => "395e9a"
  #
  # Arguments:
  #   str: (String)
  def color str
    hash = CityHash.hash32 str
    (hash**(1.0 / @options[:frequency])).to_i.to_s 16
  end

  # Convert string to colors
  #
  # Example:
  #   >> Colos.colors("word")
  #   => ["b7d989", "395e9a", "14e8c0"]
  #
  # Arguments:
  #   str: (String)
  def colors str
    hash = CityHash.hash32 str
    colors = []

    for i in (12..16) do
      q = (hash**(1.0 / (i / 10.0))).to_i
      colors << q.to_s(16) if q.to_s(16).size == 6
    end

    colors
  end

end
