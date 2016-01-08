class Battle < ActiveRecord::Base
  attr_accessor :count

  ITERATIONS_COUNT = 5

  validates :before, :after, presence: true
  validates :result, presence: true, unless: :count

  has_many :comments, class_name: 'Comment', foreign_key: :head_battle_id
  has_one :comment, class_name: 'Comment', foreign_key: :comment_battle_id

  def compare
    Benchmark.bm do |x|
      x.report('before') { ITERATIONS_COUNT.times { eval(before) } }
      x.report('after')  { ITERATIONS_COUNT.times { eval(after) } }
    end
  rescue Exception => e
    e.message
  end
end
