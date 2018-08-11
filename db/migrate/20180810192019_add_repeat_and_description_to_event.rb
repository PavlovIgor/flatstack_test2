class AddRepeatAndDescriptionToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :repeat, :integer
    add_column :events, :description, :text
  end
end
