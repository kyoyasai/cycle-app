class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string     :title,         null: false
      t.integer    :prefecture_id, null: false
      t.float      :distance,      null: false
      t.text       :content,       null: false
      t.references :user,          foreign_key: true
      t.timestamps
    end
  end
end
