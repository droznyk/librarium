class AddUserRefToLibraries < ActiveRecord::Migration[5.1]
  def change
    add_reference :libraries, :user, foreign_key: true
  end
end
