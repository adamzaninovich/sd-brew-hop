class CreateHops < ActiveRecord::Migration
  def change
    create_table :hops do |t|
      t.references :user, index: true
      t.references :brewery, index: true
      t.string :image
      t.text :message

      t.timestamps
    end
  end
end
