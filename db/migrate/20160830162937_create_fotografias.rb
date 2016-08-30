class CreateFotografias < ActiveRecord::Migration[5.0]
  def change
    create_table :fotografias do |t|

      t.timestamps
    end
  end
end
