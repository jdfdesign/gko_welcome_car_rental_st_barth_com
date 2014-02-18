class CreateCarTables < ActiveRecord::Migration
  def up
    create_table :cars, :force => true  do |t|
      t.integer :section_id, :null => false
      t.integer :site_id, :null => false
      t.text :body
      t.text :specifications
      t.string :title
      t.string :meta_title
      t.string :meta_description
      t.string :slug
      t.integer :season_one_price_per_day
      t.integer :season_one_price_per_week
      t.integer :season_two_price_per_day
      t.integer :season_two_price_per_week
      t.integer :season_three_price_per_day
      t.integer :season_three_price_per_week
      t.integer :insurance_price_per_day
      t.integer :insurance_price_per_week
      t.timestamps
    end
    add_index :cars, :section_id, :name => "index_cars_on_section"
    add_index :cars, :site_id, :name => "index_cars_on_site"
    
    Car.create_translation_table!(
      :body => :text, 
      :specifications => :text, 
      :meta_title => :string, 
      :meta_description => :string, 
      :slug => :string, 
      :title => :string) 

  end
  
  def down
    drop_table :cars
  end
end