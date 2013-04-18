require "cityhash"

class Colos
  
  # Options store
  attr_reader :options

  # Initializer
  #
  # Example:
  #   >> Colos.new frequency: 1.2, randomizr: 12, format: :hex
  #   => Colos instance
  #
  # Arguments:
  #   options: (Hash)
  def initialize options = {}
    default_options = {
      frequency: 1.4,
      randomizr: 0,
      format: :hex
    }

    # merge
    @options = default_options.merge options

    check_options
  end

  # Options setter
  def options= key, value
    @options[key] = value

    check_options
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

    number = ip.permutation(3).to_a[@options[:randomizr]]

    if @options[:format] == :hex
      make_color number
    else
      to_rgb make_color number
    end
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
    colors = []

    raise "Invalid IP" unless ip.size == 4

    ip.permutation(3).to_a.each do |number|
      colors << make_color(number)
    end

    if @options[:format] == :hex
      colors
    else
      colors.map do |hex|
        to_rgb hex
      end
    end
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
    hex = (hash**(1.0 / @options[:frequency])).to_i.to_s 16

    if @options[:format] == :hex
      hex
    else
      to_rgb hex
    end
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

    if @options[:format] == :hex
      colors
    else
      colors.map do |hex|
        to_rgb hex
      end
    end
  end

private

  def check_options
    raise "Frequency option should be from 1.2 to 1.6" unless (1.2..1.6).include? @options[:frequency]
    raise "Randomizr option should be from 0 to 23" unless (0..23).include? @options[:randomizr]
    raise "Format can be hex or rgb" unless [:hex, :rgb].include? @options[:format]
  end

  def make_color number
    hex = ""
    
    number.map(&:to_i).each do |b|
      b = b.to_s 16
      b = "0#{b}" unless b.size == 2
      hex << b
    end

    hex
  end

  def to_rgb hex
    hex.match(/(..)(..)(..)/).to_a.map(&:hex)[1..-1]
  end

end
