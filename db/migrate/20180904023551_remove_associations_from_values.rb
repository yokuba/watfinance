class RemoveAssociationsFromValues < ActiveRecord::Migration[5.2]
  def change
  	change_table :values do |t|
			t.remove_references :company
			t.remove_references :user
    end
  end
end
