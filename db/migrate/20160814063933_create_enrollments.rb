class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.integer :lecture_id
      t.integer :user_id

      t.timestamps
    end

    add_index :enrollments, :lecture_id
    add_index :enrollments, :user_id
    add_index :enrollments, [:lecture_id, :user_id], unique: true
  end
end
