class AddValueToCompany < ActiveRecord::Migration[5.2]
  def change
    add_reference :companies, :value, foreign_key: true
  end
end
