class CreateBiddings < ActiveRecord::Migration[5.2]
  def change
    create_table :biddings do |t|
      t.float :price
      t.references :user, foreign_key: true
      t.references :auction, foreign_key: true
      
      t.timestamps
    end
  end
end
