# class CreateProducts < ActiveRecord::Migration
#   def change
#     create_table :products do |t|
#       t.string :name
#       t.decimal :price
#       t.string :image_url

#       t.timestamps
#     end
#   end
# end

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price

      t.string :image_url
      t.timestamps
    end
  end
end