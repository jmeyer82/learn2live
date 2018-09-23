class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :profile_type
      t.string :roles
      t.string :education
      t.string :time
      t.string :description_roles
      t.string :description_education
      t.string :attributes_roles
      t.string :attributes_education
      t.string :skill_share

      t.timestamps
    end
  end
end
