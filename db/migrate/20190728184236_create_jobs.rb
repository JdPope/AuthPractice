class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :name
      t.json :rre 
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
