class AddFieldsToNote < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :customer_id, :uuid
  end
end
