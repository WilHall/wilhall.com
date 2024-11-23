module MarkdownHandler
  def self.erb
    @erb ||= ActionView::Template.registered_template_handler(:erb)
  end

  def self.call(template, source)
    compiled_source = erb.call(template, source)
    "Redcarpet::Markdown.new(Redcarpet::Render::HTML.new).render(begin;#{compiled_source};end.to_s).html_safe"
  end
end

# Now we tell Rails to process any files with the `.md` extension using our new MarkdownHandler
ActionView::Template.register_template_handler :md, MarkdownHandler