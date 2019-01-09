
class USALocationTools

  # TO DO - TEST ME

  def initialize
    # CS is the citystate gem
    @states = CS.states(:us)
  end

  def city_state(location)
    city, state = location.split(',')
    state.gsub!(' ', '')
    { city: city, state: state }
  end

  def get_short_state(state)
    state_is_formatted?(state) ? state : find_short(state)
  end

  def state_is_formatted?(state)
    state.size == 2 && validate_state(state)
  end

  def validate_state(short)
    @states.has_key?(short.to_sym)
  end

  def find_short(long)
    key_value = @states.rassoc(long)
    short = key_value.first.to_s if key_value
  end


end
