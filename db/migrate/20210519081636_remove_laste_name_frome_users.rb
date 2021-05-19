class RemoveLasteNameFromeUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :laste_name, :string
  end
end
