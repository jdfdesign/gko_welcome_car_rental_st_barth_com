# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

I18n.locale = :fr
@site = Site.first

@catalog = @site.car_lists.find_or_create_by_name!(
    :name => "Fleet",
    :title => "Fleet",
    :parent_id => @site.sections.root.id,
    :published_at => Time.zone.now)

@catalog.cars.all.map(&:destroy)

8.times do |i|
  @product = @catalog.cars.create!(
    :title => "#{type} neuf #{i}",
    :specifications => lorem, 
    :body => lorem,
    :season_one_price_per_day => 50..100, 
    :season_one_price_per_week => 300..600,
    :season_two_price_per_day => 50..100,  
    :season_two_price_per_week => 300..600, 
    :season_three_price_per_day => 50..100,  
    :season_three_price_per_week => 300..600, 
    :insurance_price_per_day => 50..100,  
    :insurance_price_per_week => 300..600)
end
