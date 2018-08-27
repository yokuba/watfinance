class CreateValues < ActiveRecord::Migration[5.2]
  def change
    create_table :values do |t|
    	t.string :title
    	t.text :description
    	t.belongs_to :company, index: true
    	t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
