class CreateTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :trainings do |t|
      t.string :title
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end
