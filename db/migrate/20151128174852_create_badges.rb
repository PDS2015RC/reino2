class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :issuer_url
      t.string :issuer_organization
      t.string :earner_email
      t.string :name
      t.string :description
      t.string :img_url
      t.date :issued_on

      t.timestamps null: false
    end
  end
end
