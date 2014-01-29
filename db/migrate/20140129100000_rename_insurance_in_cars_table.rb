class RenameInsuranceInCarsTable < ActiveRecord::Migration
  def change
    rename_column :cars, :insurance_price_per_day, :insurance
    rename_column :cars, :insurance_price_per_week, :deductible
  end
end