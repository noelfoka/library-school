class Book
  attr_accessor :title, :author

  has_many :rental

  def initialize(title, author)
    @title = title
    @author = author
  end
end
