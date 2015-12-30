class Comment < ActiveRecord::Base
  belongs_to :head_battle, class_name: 'Battle'
  belongs_to :comment_battle, class_name: 'Battle'
  belongs_to :user

  accepts_nested_attributes_for :comment_battle, allow_destroy: true
end
