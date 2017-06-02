class Map
  attr_reader :map

  def initialize
    @map = []
  end

  def binary_search (array, target)
    return nil if array.empty?

    mid_index = array.length / 2
    case array[mid_index].first <=> target
    when -1
      binary_search(array.take(mid_index), target)
    when 0
      mid_index
    when 1
      sub_answer = binary_search(nums.drop(mid_index + 1), target)
      if sub_answer.nil?
        nil
      else
        mid_index + sub_answer
      end
    end
  end

  def assign(key, value)
    index_of_key = binary_search(map, key)
    (index_of_key.nil?) ? map.push([key, value]) : map[index_of_key] = [key, value]
  end

  def lookup(key)
    map.each do |pairs|
      if pairs.first == key
        return puts "#{pairs.first} = #{pairs.last}"
      end
    end

    puts 'no match'
  end

  def remove(key)
    map.each_with_index do |pairs, index|
      if pairs.first == key
        map[index] = nil
      end
    end

    map.compact!
  end

  def show
    puts "#{map}"
  end

end

new_map = Map.new
new_map.show
new_map.assign('name', 'Andrew')
new_map.show
new_map.lookup('name')
new_map.assign('name', 'Kelly')
new_map.show
new_map.remove('name')
new_map.show
