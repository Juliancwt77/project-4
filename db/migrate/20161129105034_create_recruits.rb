class CreateRecruits < ActiveRecord::Migration[5.0]
  def change
    create_table :recruits do |t|
      t.integer :status
      t.integer :completion
      t.string :scope
      t.integer :rating
      t.date :start_date
      t.date :end_date
      t.integer :posting_id
      t.integer :company_id

      t.timestamps
    end
  end
end
