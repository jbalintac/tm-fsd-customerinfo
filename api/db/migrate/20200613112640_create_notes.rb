class CreateNotes < ActiveRecord::Migration[6.0]
  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

  def change
    create_table :notes, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.text :value

      t.timestamps
    end
  end
end
