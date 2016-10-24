class FloatGenerator

  def initialize( min, max )
    @min = min
    @max = max
    @delta = max - min
  end

  def sample
    result = @min + (@delta * rand())
  end
end
