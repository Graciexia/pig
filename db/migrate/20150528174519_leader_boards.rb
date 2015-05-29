class LeaderBoards < ActiveRecord::Migration
  def change
    create_table :leader_boards do |t|
      t.column :player_name, :string
      t.column :win, :integer
      t.column :loss, :integer
    end
  end
end
