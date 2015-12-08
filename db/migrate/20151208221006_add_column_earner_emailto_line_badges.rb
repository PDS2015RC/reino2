class AddColumnEarnerEmailtoLineBadges < ActiveRecord::Migration
  def change
  	add_column :line_badges, :earner_email, :string
  end
end
