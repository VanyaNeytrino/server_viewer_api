# frozen_string_literal: true

class CreateBandwidths < ActiveRecord::Migration[6.0]
  def change
    create_table :bandwidths do |t|
      t.integer :server_id
      t.float :value
      t.text :interface_name
      t.serial :value_id

      t.timestamps
    end
  end
end
