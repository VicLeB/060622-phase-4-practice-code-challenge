class CreateAppearances < ActiveRecord::Migration[6.1]
  def change
    create_table :appearances do |t|
      t.integer :rating
      t.belongs_to :episode, null: false, foreign_key: true
      t.belongs_to :guest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
