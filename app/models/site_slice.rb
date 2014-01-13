Site.class_eval do
  has_many :car_lists
  has_many :cars, :through => :car_lists

  def car_list
    car_lists.first
  end
end