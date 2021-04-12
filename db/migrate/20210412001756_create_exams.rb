class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.references :college, null: false, foreign_key: true, index: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
