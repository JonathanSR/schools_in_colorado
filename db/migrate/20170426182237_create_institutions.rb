class CreateInstitutions < ActiveRecord::Migration[5.0]
  def change
    create_table :institutions do |t|
      t.string :name
      t.text :city
      t.text :street
      t.text :state
      t.float :latitude
      t.float :longitude
    end
  end
end
