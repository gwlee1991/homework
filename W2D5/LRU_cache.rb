class LRUCache
  attr_reader :cache, :size

   def initialize(size)
     @cache = Array.new
     @size = size
   end

   def count
     @cache.count
   end

   def add(el)

    if @cache.include?(el)
      @cache.push(@cache.delete(el))
    elsif @cache.count < size
      @cache.push(el)
    else
      @cache.shift
      @cache.push(el)
    end

   end

   def show
     p @cache
   end

   private
   # helper methods go here!

 end

johnny_cache = LRUCache.new(4)
johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show
