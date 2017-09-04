class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :status, foreign_key: true
      t.references :user, foreign_key: true
      t.text :comment
      t.datetime :date

      t.timestamps
    end
  end
end
