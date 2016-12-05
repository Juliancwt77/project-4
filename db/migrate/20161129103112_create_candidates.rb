class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.string :title
      t.string :language
      t.string :description
      t.integer :rate
      t.integer :status
      t.string :photo
      t.integer :individual_id

      t.timestamps
    end
  end
end
