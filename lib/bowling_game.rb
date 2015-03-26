require "frame"
class BowlingGame

  def initialize
    @current_frame = 0
    @score = 0
    # 10.times{@frames << Frame.new}
    prev = nil
    @frames = Array.new(10) do
      current = Frame.new
      if prev
        prev.next = current
      end
      prev = current
    end

  end

  def roll(pins_knocked_down)
    @frames[@current_frame].roll(pins_knocked_down)
    if @frames[@current_frame].completed?
      @current_frame += 1
    end
    # called multiple times to simulate a person throwing a ball and knocking down pins
  end

  def score
    value = 0
    @frames.each{|f| value += f.score}
    value
    # called to retrieve the current score
  end

  def completed?
    @frames.last.completed?
  end

private
  # ...and here when the above becomes too complex.

end
