require('date')

class DateGenerator

  def initialize( min_date, max_date )

    if min_date > max_date
      raise "min_date (first arg) must be less than max (second arg)"
    end

    @min_date = min_date
    @max_date = max_date
    @delta = (@max_date - @min_date).to_i
  end

  def sample()
    days_to_add = rand(0..@delta)
    result = @min_date + days_to_add
    return result
  end

end
