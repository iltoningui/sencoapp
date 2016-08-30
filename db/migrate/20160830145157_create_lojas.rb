class CreateLojas < ActiveRecord::Migration[5.0]
  def change
    create_table :lojas do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :fotografia_da_loja
      t.integer :estado ,             default: 1

      t.timestamps
    end
  end
end
