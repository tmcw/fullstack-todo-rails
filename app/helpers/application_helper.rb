module ApplicationHelper
  def nav_link(name, link_path)
    link_to name, link_path, class: current_page?(link_path) ? "selected" : ""
  end
end
