module Veda
  module Helpers
    def date(date)
      date.strftime("%b %e, %Y")
    end

    def markdown(text)
      rndr = MarkdownRenderer.new(:filter_html => true)
      options = {
        :fenced_code_blocks => true,
        :no_intra_emphasis => true,
        :autolink => true,
        :strikethrough => true,
        :lax_html_blocks => true,
        :superscript => true,
      }
      markdown_to_html = Redcarpet::Markdown.new(rndr, options)
      markdown_to_html.render(text)
    end

    def gravatar(email)
      gravatar_id = Digest::MD5.hexdigest(email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png"
    end
  end
end
