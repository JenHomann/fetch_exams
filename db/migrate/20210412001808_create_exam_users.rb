class CreateExamUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :exam_users do |t|
      t.references :exam, null: false, foreign_key: true, index: true
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
