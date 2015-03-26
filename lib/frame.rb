class Frame

  attr_accessor :next

  def initialize
    @rolls = []
    @next = nil
  end

  def roll(pins_knocked_down)
    @rolls << pins_knocked_down
  end

  def completed?
    @rolls.length == 2
  end

  def score
    value = 0
    @rolls.each{|s| value += s  }
    if value == 10 && @next
      value += @next.spare_score
    end
    value
  end

  def spare_score
    if @rolls.empty?
      0
    else
      @rolls[0]
    end
  end
end