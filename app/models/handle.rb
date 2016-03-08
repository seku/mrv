class Handle < ActiveRecord::Base
  def humanized_code
    code.gsub(".", "_")
  end
end