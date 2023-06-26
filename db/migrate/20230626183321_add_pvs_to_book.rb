class AddPvsToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :pvs, :integer, null: false, default: 0
  end
end
