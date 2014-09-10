# class CreateCategories < ActiveRecord::Migration
#   def change
#     create_table :categories do |t|

#       t.timestamps
#     end
#   end
# end

class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
