module ApplicationHelper
  def form_error_messages_for! object
    return "" if object.errors.empty?

    messages = object.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: object.errors.count,
                      resource: object.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation" class='alert alert-danger'>
      <strong>#{sentence}</strong>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
