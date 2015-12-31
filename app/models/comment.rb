class Comment < ActiveRecord::Base
  validate :text_or_battle?
  belongs_to :head_battle, class_name: 'Battle'
  belongs_to :comment_battle, class_name: 'Battle'
  belongs_to :user

  accepts_nested_attributes_for :comment_battle, allow_destroy: true

  private

  def text_or_battle?
    if comment_battle&.invalid?
      self.comment_battle = nil
      self.valid?
      errors.add(:comment, 'Comment should have Battle, Text or both.') if text.empty?
    end
  end
end
