

class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :customers, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :contact
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
