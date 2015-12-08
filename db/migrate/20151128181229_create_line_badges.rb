class CreateLineBadges < ActiveRecord::Migration
  def change
    create_table :line_badges do |t|
      t.references :badge, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
