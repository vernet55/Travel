class AddCommentToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :comment, :text
  end
end
