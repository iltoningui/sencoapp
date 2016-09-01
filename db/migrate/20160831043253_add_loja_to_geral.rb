class AddLojaToGeral < ActiveRecord::Migration[5.0]
  def change
    add_reference :gerais, :loja, foreign_key: true
  end
end
