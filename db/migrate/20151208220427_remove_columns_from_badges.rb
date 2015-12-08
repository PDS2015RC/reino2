class RemoveColumnsFromBadges < ActiveRecord::Migration
  def change
  	remove_column :badges, :earner_email, :string
  	remove_column :badges, :issued_on, :date
  end
end
