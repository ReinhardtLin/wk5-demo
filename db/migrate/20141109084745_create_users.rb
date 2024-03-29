class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :email
      t.string :name
      t.string :image

      t.string :fb_uid
      t.string :fb_token
      t.datetime :fb_expires_at

      t.timestamps
    end

    add_index :users, :fb_uid
  end
end
