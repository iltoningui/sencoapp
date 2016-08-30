class CreateGerais < ActiveRecord::Migration[5.0]
  def change
    create_table :gerais do |t|
      t.string :nome
      t.string :descricao
      t.integer :classificacao

      t.timestamps
    end
    add_column :gerais, :serviceable_type, :string
    add_index :gerais, :serviceable_type
    add_column :gerais, :serviceable_id, :integer
    add_index :gerais, :serviceable_id
  end
end
