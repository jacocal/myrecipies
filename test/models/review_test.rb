require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  
  def setup
    @review = Review.new(title: "Great Recipe!", opinion: "This could be a great recipe and i really want to make it")
  end
  
  test 'Review must be valid' do
    assert @review.valid?
  end
  
  test 'Title must be present' do
    @review.title = " "
    assert_not @review.valid?
  end
  
  test 'Title must not be too short' do
    @review.title = "a" * 2
    assert_not @review.valid?
  end
  
  test 'Title must not be too long' do
    @review.title = "a" * 41
    assert_not @review.valid?
  end
  
  test 'Opinion must be present' do
    @review.opinion = " "
    assert_not @review.valid?
  end
  
  test 'Opinion must not be too short' do
    @review.opinion = "a" * 7
    assert_not @review.valid?
  end
  
  test 'Opinion must not be too long' do
    @review.opinion = "a" * 151
    assert_not @review.valid?
  end
  
end