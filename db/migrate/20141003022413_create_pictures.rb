class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :caption
      t.references :picable, polymorphic: true
      t.attachment :photo 

      t.timestamps
    end
    add_index :pictures, :picable_id
  end
end
