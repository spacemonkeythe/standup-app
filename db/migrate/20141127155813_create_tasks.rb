class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.boolean :done
      t.belongs_to :link, index: true

      t.timestamps
    end
  end
end
