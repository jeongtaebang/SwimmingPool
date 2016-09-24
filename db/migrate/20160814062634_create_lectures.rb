class CreateLectures < ActiveRecord::Migration[5.0]
  def change
    create_table :lectures do |t|
      t.string :subject,      null: false, default: ""
      t.string :teacher,      null: false, default: ""
      t.text :content,        null: false, default: ""
      t.string :timeinfo,      null: false, default: ""

      t.timestamps
    end

    add_index :lectures, :subject,         unique: true
    add_index :lectures, :timeinfo,        unique: true
  end
end
