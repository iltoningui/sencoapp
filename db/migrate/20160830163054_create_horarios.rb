class CreateHorarios < ActiveRecord::Migration[5.0]
  def change
    create_table :horarios do |t|
      t.integer :dia
      t.time :entrada
      t.time :saida
      t.references :loja, foreign_key: true

      t.timestamps
    end
  end
end
