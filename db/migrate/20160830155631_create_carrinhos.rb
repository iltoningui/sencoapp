class CreateCarrinhos < ActiveRecord::Migration[5.0]
  def change
    create_table :carrinhos do |t|
      t.integer :estado, default: 1
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
