class AddCreatedByToPolls < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :created_by, :integer
  end
end
