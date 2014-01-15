class CarList < Section  
  include Extensions::Models::IsList
  has_many  :cars, 
            :foreign_key => 'section_id', 
            :dependent => :destroy

  def content_type
   'Car'
  end
end