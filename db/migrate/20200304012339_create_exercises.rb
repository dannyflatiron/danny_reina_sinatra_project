class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.date :date_performed
      t.integer :max_lift
      t.integer :athlete_id
    end
  end
end
