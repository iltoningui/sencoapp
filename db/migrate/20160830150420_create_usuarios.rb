class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :apelido
      t.string :telefone
      t.integer :genero
      t.date :data_de_nascimento
      t.integer :roles_mask,        default:12
      t.string :nome_da_empresa

      t.timestamps
    end
  end
end
