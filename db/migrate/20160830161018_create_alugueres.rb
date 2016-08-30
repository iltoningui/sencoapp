class CreateAlugueres < ActiveRecord::Migration[5.0]
  def change
    create_table :alugueres do |t|

      t.timestamps
    end
  end
end
