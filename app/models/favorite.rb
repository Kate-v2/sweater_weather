
class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :location

  validates_uniqueness_of :location, scope: [:user]


  # TO DO - Test me
  def joint_location
    "#{location.city},#{location.state_short}"
  end


end
