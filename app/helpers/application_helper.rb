module ApplicationHelper
  def is_current?(name)
    controller.action_name == name ? "current" : ""
  end
end
