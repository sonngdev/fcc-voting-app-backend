class AddDefaultValueToVotesTimes < ActiveRecord::Migration[5.2]
  def change
    change_column_default :votes, :times, 1
  end
end
