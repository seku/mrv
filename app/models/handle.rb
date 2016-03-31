class Handle < ActiveRecord::Base

  before_save :set_fake_search

  def humanized_code
    code.gsub(".", "_")
  end

  def set_fake_search
    self.fake = kind.gsub(" ", "")
  end 
end