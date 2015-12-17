class Battle < ActiveRecord::Base
  ITERATIONS_COUNT = 50_000
  validates :before, :after, presence: true

  def compare
    Benchmark.bm do |x|
      x.report('before') { ITERATIONS_COUNT.times { eval(before) } }
      x.report('after')  { ITERATIONS_COUNT.times { eval(after) } }
    end
  rescue Exception => e
    @error = e
  end
end
