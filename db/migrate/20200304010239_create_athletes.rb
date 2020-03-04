class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :username
      t.string :password_digest
    end
  end
end
