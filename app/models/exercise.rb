class Exercise < ActiveRecord::Base

    # a belongs_to macro means there must be a foreign id key in the objects data table
    belongs_to :athlete


    # does this work for this class/
    # validates :name, presence: true
    # validates :max_lift, presence: true
end
