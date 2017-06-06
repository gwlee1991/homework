class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times {cup << :stone}
    end
  end

  def valid_move?(start_pos)
      raise "Invalid starting cup" if start_pos > 12 || start_pos < 0
      raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    grip = cups[start_pos].dup
    @cups[start_pos] = []
    # iterate through @cups[start_pos + 1]

    cup_idx = start_pos
    until grip.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      if cup_idx == 6
        @cups[6] << grip.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << grip.pop if current_player_name == @name2
      else
        @cups[cup_idx] << grip.pop
      end
    end
    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      return :switch
    else
    ending_cup_idx
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if cups[1..6].all? {|cup| cup.empty?} || cups[7..12].all? {|cup| cup.empty?}
    false
  end

  def winner
    if cups[6] == cups[13]
      :draw
    elsif cups[6].count > cups[13].count
      @name1
    else
      @name2
    end
  end
end
