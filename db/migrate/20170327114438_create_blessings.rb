class CreateBlessings < ActiveRecord::Migration
  def change
    create_table :blessings do |t|
    	t.string :photo
    	t.string :nickname
    	t.text :blessing
    	t.string :question
    	t.boolean :solved, default: false
      t.timestamps null: false
    end
  end
end
