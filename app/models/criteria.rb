class Criteria
  attr_reader :weather_id, :weather
  def initialize(attrs = nil)
    @weather_id = attrs['weather_id'].to_i unless attrs.nil?
  end
end
