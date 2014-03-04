class Admin::CarsController < Admin::ResourcesController
  respond_to :html
  nested_belongs_to :site, :car_list
  custom_actions :collection => [:selected]
  has_scope :with_query, :only => :index
end
