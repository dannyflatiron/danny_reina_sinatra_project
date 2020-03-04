class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :name
      t.string :age
      t.string :gender
      t.string :password_digest
    end
  end
end
