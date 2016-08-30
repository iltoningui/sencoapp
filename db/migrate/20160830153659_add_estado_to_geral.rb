class AddEstadoToGeral < ActiveRecord::Migration[5.0]
  def change
    add_column :gerais, :estado, :integer, default: 1
  end
end
