class CreateExerciseNames < ActiveRecord::Migration[5.1]
  def change
    create_table :exercise_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
