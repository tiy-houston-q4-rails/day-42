class Order < ActiveRecord::Base

  def description
    headline = "#{meat} on #{bread}"
    if pickles?
      headline << ", with pickles"
    end
    headline
  end
end
