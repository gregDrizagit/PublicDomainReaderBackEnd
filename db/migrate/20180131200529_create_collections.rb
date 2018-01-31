class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.string :name
      t.belongs_to :user, foreign_key: true
    end
  end
end
