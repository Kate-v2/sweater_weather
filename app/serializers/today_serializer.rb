
class TodaySerializer

  include FastJsonapi::ObjectSerializer

  attributes  :id,
              :time,
              :icon,
              :low,
              :high,
              :humidity,
              :visibility,
              :uv_index

end
