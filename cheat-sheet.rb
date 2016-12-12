rails generate migration AddPartNumberToProducts part_number:string
class AddPartNumberToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :part_number, :string
  end
end

rails generate migration RemovePartNumberFromProducts part_number:string
class RemovePartNumberFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :part_number, :string
  end
end

rails generate migration AddDetailsToProducts 'price:decimal{5,2}' supplier:references{polymorphic}
class AddDetailsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price, :decimal, precision: 5, scale: 2
    add_reference :products, :supplier, polymorphic: true
  end
end

rails g migration change_date_format_in_my_table
class ChangeFormatInMyTable < ActiveRecord::Migration
  def change
    change_column :my_table, :my_column, :my_new_type
  end
end
http://api.rubyonrails.org/classes/ActiveRecord/Migration/CommandRecorder.html

rails generate model Product name:string description:text
class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
 
      t.timestamps
    end
  end
end


