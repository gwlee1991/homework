class Map
  attr_reader :map
  def initialize
    @map = []
  end

  def assign(key, value)


    map.each_with_index do |keys, index|
      if keys.first == key
        keys[index].last = value
      end
    end

    map.push([key, value])
  end

  def lookup(key)
    map.each do |pairs|
      if pairs.first == key
        return "#{pairs.first} = #{pairs.last}"
    end

    puts 'no match'
  end

  def remove(key)

  end

  def show
    puts "#{map}"
  end

end
