# frozen_string_literal: true

class Views::Cards::Index < Views::Base
  def view_template
    h1 { "Cards::Index" }
    p { "Find me in " }
  end
end
