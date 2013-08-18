class Criteria
  attr_reader :weather_id, :weather
  def initialize(attrs)
    @weather_id = attrs['weather_id'].to_i
    @weather = Weather.find(@weather_id)
  end
end
