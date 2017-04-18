class Create < ActiveRecord::Migration[5.0]
  def change
    create_table :years do |t|
      t.string :date_year
    end
  end
end
