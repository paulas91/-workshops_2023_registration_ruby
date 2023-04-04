class CountElements

  attr_reader :results

  def initialize(results)
    @results = results
  end

  def perform
    @results.group_by(&:itself).transform_values(&:count)
  end
end







