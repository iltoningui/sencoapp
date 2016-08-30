class CreatePiteus < ActiveRecord::Migration[5.0]
  def change
    create_table :piteus do |t|

      t.timestamps
    end
  end
end
