# class CreateCustomers < ActiveRecord::Migration
#   def change
#     create_table :customers do |t|
#       t.string :name
#       t.string :email
#       t.string :zipcode

#       t.timestamps
#     end
#   end
# end

class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :zipcode

      t.timestamps
    end
  end
end