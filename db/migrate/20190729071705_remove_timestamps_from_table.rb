class RemoveTimestampsFromTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :olympians, :created_at, :string
    remove_column :olympians, :updated_at, :string
  end
end
