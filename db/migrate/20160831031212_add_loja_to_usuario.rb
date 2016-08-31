class AddLojaToUsuario < ActiveRecord::Migration[5.0]
  def change
    add_reference :usuarios, :loja, foreign_key: true
  end
end
