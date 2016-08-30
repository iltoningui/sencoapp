class CreateLocalizacoes < ActiveRecord::Migration[5.0]
  def change
    create_table :localizacoes do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :city
      t.string :address
      t.string :state
      t.string :state_code
      t.string :postal_code
      t.string :country
      t.string :country_code
      t.integer :tipo
      

      t.timestamps
    end
    add_column :localizacoes, :endereco, :string
    add_column :localizacoes, :street, :string
    add_column :localizacoes, :locationable_type, :string
    add_index :localizacoes, :locationable_type
    add_column :localizacoes, :locationable_id, :integer
    add_index :localizacoes, :locationable_id
  end
end
