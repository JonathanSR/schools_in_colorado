class CreateUserSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :user_searches do |t|
      t.string :school
      t.string :ethnicity
      t.string :program_grads
      t.string :ethnicity_grads
      t.string :year
      t.string :percentage_one
      t.string :percentage_two
      t.string :program
      t.references :user, foreign_key: true
    end
  end
end
