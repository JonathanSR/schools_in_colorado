class AddBasicToInstitutions < ActiveRecord::Migration[5.0]
  def change
    add_column :institutions, :zip, :string
    add_column :institutions, :phone_number, :string
    add_column :institutions, :web, :string
  end
end
