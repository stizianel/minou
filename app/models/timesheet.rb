class Timesheet < ActiveRecord::Base
  belongs_to :user
  has_many   :timedays, dependent: :destroy 
end
