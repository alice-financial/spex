class CreateStripeUsers < ActiveRecord::Migration
  def change
    create_table :stripe_users do |t|
      t.string :name
      t.string :email
      t.string :stripe_id

      t.timestamps
    end
  end
end
