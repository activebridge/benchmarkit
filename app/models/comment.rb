class Comment < ActiveRecord::Base
  belongs_to :head_battle, class_name: 'Battle'
  belongs_to :better_battle, class_name: 'Battle'
end
