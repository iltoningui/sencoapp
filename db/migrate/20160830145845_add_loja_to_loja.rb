class AddLojaToLoja < ActiveRecord::Migration[5.0]
  def change
    add_reference :lojas, :loja, foreign_key: true
    add_column :lojas, :representante_id, :integer
    add_index :lojas, :representante_id
  end
end
