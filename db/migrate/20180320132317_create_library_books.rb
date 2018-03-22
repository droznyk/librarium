class CreateLibraryBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :library_books do |t|
      t.belongs_to :library, index: true
      t.belongs_to :book, index: true

      t.timestamps
    end
  end
end
