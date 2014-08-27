class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.string :identification
      t.string :email
      t.integer :local_account_id
      
      t.timestamps
    end
  end
end
