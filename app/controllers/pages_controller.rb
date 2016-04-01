class PagesController < ApplicationController
  def products; end;
  def home;  end;
  def distributors; end;
  def racing_team; end;
  
  def fitment
    @handles_for_js = Handle.all.map do |h| 
      {
        fake: "#{h.make} #{h.kind} #{h.years} #{h.fake}",
        value: "#{h.make} #{h.kind} #{h.years}",
        label: "#{h.make} #{h.kind} #{h.years}",
        code: h.humanized_code
      }
    end.to_json
    @handles = Handle.all
  end
  
  def contact; end;
end
