class Setup < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.string :title
      t.string :question

      t.timestamps
    end

    create_table :votes do |t|
      t.references :poll, foreign_key: true
      t.string :name
      t.integer :times

      t.timestamps
    end
  end
end
