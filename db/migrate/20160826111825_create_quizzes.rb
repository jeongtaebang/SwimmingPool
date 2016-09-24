class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
    	t.integer :user_id
      t.string :word, null: false, default: ""
      t.text :definition, null: false, default: ""

      t.timestamps
    end

    add_index :quizzes, :word
    add_index :quizzes, :user_id
  end
end
