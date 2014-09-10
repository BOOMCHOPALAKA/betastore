class Category < ActiveRecord::Base
  has_many :products, :through => :categorizations

#validates vs validate
#validates says "which field do you want to validate?"
#standard types
#validate (singular) checks specific things like methods
#another example would be "validate that it is an actual URL"

 #SEE ACTIVE RECORD SLIDES ON VALIDATION
  #http://pjb3.github.io/back-end-web-development/03_sql_models_routing_controllers/active_record#47

  validates :name, presence: true


end