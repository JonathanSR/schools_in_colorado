class CreateProgram < ActiveRecord::Migration[5.0]
  def change
    create_table :programs do |t|
      t.string :cip2
      t.string :name
    end
  end
end
