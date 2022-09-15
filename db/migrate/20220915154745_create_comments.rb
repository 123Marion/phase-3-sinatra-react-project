class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :comment
      t.boolean :like
      t.integer :user_id
      t.integer :quote_id
      t.timestamps
    end
  end
end
