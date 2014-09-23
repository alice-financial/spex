module ApplicationHelper

  def form_error_messages_for! object
    return "" if object.errors.empty?

    messages = object.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    heading = "Validation error(s):"

    html = <<-HTML
    <div>
      <strong>#{heading}</strong>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
