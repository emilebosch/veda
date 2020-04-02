module Veda
  class MarkdownRenderer < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.highlight(code, language || "none")
    end
  end
end
