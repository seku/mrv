class PagesController < ApplicationController
  def products; end;
  def home;  end;
  def distributors; end;
  def racing_team; end;
  
  def fitment
    @handles_for_js = Handle.all.map do |h| 
      {
        value: "#{h.make} #{h.kind} #{h.code}",
        label: "#{h.make} #{h.kind}",
        code: h.humanized_code
      }
    end.to_json
    @handles = Handle.all
  end
  
  def contact; end;
end
