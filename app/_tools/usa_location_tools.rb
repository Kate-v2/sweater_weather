
class UsaLocationTools

  # Initializes with nothing

  def city_state(location)
    city, state = location.split(',')
    state.gsub!(' ', '')
    @breakdown ||= { city: city, state: state }
  end

  def state_abbreviation(state)
    @short ||= state.size > 2 ? states.rassoc(state) : state
  end

  def validate_state(short)
    states.has_key?(short.to_sym)
  end

  # TOOL - CS is the citystate gem
  def states
    @states ||= CS.states(:us)
  end

end
