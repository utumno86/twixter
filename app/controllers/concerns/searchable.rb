
module Searchable
  extend ActiveSupport::Concern

  def search(word)
    searched_twixts = []
    twixts = Twixt.order(created_at: :desc)
    twixs.each do |twixt|
      if twixt.include? word
        searched_twixts << twixt
      end
    end
  end
end