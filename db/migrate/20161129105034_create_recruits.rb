class CreateRecruits < ActiveRecord::Migration[5.0]
  def change
    create_table :recruits do |t|
      t.integer :status
      t.integer :completion
      t.string :scope
      t.real :rating
      t.datetime :start_date
      t.datetime :end_date
      t.integer :posting_id
      t.integer :company_id

      t.timestamps
    end
  end
end
