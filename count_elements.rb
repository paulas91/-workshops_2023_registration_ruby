class CountElements
  def initialize(results)
    @results = results
  end

  def perform
    @results.group_by(&:itself).transform_values(&:count)
  end

  private

  attr_reader :results
end
