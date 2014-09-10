# class CreateOrders < ActiveRecord::Migration
#   def change
#     create_table :orders do |t|
#       t.belongs_to :customer, index: true
#       t.datetime :placed_at
#       t.decimal :total_amount

#       t.timestamps
#     end
#   end
# end


class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :customer, index: true
      t.datetime :placed_at
      t.decimal :total_amount
      t.belongs_to :credit_card, index: true

      t.timestamps
    end
  end
end
