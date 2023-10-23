class AddFractalRelationships < ActiveRecord::Migration[7.0]
  def change
    add_reference(:fractals, :parent, foreign_key: { to_table: :fractals })
  end
end
