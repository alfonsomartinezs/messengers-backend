class CreateAspects < ActiveRecord::Migration[7.0]
  def change
    create_table :aspects do |t|
      t.string :title
      t.references :aspect_type, null: false, foreign_key: true
      t.references :fractal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
