class AddDonationAmountToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :donation_amounts, :integer
  end
end
