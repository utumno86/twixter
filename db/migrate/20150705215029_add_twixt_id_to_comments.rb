class AddTwixtIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :twixt_id, :integer
  end
end
