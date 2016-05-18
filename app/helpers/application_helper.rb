module ApplicationHelper

  # funkcja pomocnicza, dodaje klasę active do znacznika li i tworzy odnosnik
  # 'podświetla' aktualną strone w nawigacji
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end
  
  def resource_name
    :employee
  end

  def resource
    @resource ||= Employee.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:employee]
  end
end
