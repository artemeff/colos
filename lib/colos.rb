class Colos
  class << self
    # Convert string to color
    #
    # Example:
    #   >> Colos.color("test")
    #   => "924436"
    #
    # Arguments:
    #   str: (String)
    def color str
      hash = 0

      str.each_byte do |b|
        hash = b + ((hash << 5) - hash)
      end

      color = []

      3.times do |i|
        value = (hash >> (i * 8)) & 0xFF
        color << ('00' + value.to_s(16))[-2..-1]
      end

      color.join
    end
  end
end
