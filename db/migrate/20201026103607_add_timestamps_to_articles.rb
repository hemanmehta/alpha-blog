class AddTimestampsToArticles < ActiveRecord::Migration[6.0]
  def change
    #adding two columns add_column :tablename, :col_name, :datatype
    add_column :articles, :created_at, :datetime   
    add_column :articles, :updated_at, :datetime
  end
end
