class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name
#      t.has_many :products

      t.timestamps
    end
  end
end
