
class DaySerializer

  include FastJsonapi::ObjectSerializer

  attributes  :id,
              :icon,
              :summary,
              :precip_probability,
              :precip_type,
              :low,
              :high

end
