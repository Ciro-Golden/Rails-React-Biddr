class CreateAuctions < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :description
      t.float :price
      t.boolean :reserve
      t.datetime :expiry_date

      t.timestamps
    end
  end
end
