class CarsController < ContentsController
  respond_to :html, :js
  belongs_to :car_list
  has_scope :with_title, :only => :index

  protected
  
  def load_resources
    end_of_association_chain.includes(self.includes).with_globalize.order("cars.season_one_price_per_week")
  end

  def find_resource
    if params[:permalink].present?
      permalink = params[:permalink].split('/')
      begin
        c = end_of_association_chain.by_permalink(*permalink).first
      rescue
        error_404
      end
    elsif params[:id].present?
      begin
        c = end_of_association_chain.find(params[:id])
      rescue
        error_404
      end
    end
    set_resource_ivar(c)
  end 
end
