class Car < ActiveRecord::Base

  TRANSLATED_FIELD = [
    :title, :specifications, :body, :meta_description, :meta_title, :slug
  ].freeze

  translates *TRANSLATED_FIELD

 class Translation 
   attr_accessible :locale 
 end
  
  attr_accessible(:title, :specifications, :body, 
    :meta_description, :meta_title, :slug, 
    :season_one_price_per_day, :season_one_price_per_week,
    :season_two_price_per_day, :season_two_price_per_week, 
    :season_three_price_per_day, :season_three_price_per_week, 
    :insurance, :deductible)

  include Extensions::Models::BelongsToSection
  include Extensions::Models::Sluggable
  include Extensions::Models::HasManyImageAssignments 

  validates :title, :presence => true, :uniqueness => {:scope => :section_id, :case_sensitive => false}
  
  def self.with_title(q)
    joins(:translations).where("#{self.translation_class.table_name}.title LIKE ?", "%#{q}%")
  end
  

  
  # Indicate if this page should be included in robot.txt # use trackable? rather than checking the attribute directly. this # allows sub-classes to override trackable? if they want to provide # their own definition. 
  def trackable? 
    true 
  end
  
end
