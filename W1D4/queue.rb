class Queue
  attr_reader :que
  def initialize
    @que = []
  end

  def enqueue(el)
    que.push(el)
  end

  def dequeue
    que.shift
  end

  def show
    puts "#{que}"
  end

end
