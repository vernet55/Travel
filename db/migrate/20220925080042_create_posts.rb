class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.string :title
      t.string :body
      t.string :image
      t.integer :customer_id

      t.timestamps
    end
  end
end
