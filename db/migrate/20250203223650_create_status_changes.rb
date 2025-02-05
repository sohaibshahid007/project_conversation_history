class CreateStatusChanges < ActiveRecord::Migration[7.2]
  def change
    create_table :status_changes do |t|
      t.string :old_status
      t.string :new_status
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
