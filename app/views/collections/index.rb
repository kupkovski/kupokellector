# frozen_string_literal: true

class Views::Collections::Index < Views::Base
  def initialize(collections:)
    @collections = collections
  end

  def view_template
    # ul do 
    #   @collections.each do |collection|
    #     li do
    #       link_to collection.name, collection_path(collection)
    #     end
    #   end
    # end


    div(class: "w-full") do
	Accordion do
		AccordionItem do
			AccordionTrigger do
				p(class: "font-medium") { "What is PhlexUI?" }
				AccordionIcon()
			end

			AccordionContent do
				p(class: "text-sm pb-4") do
					"PhlexUI is a UI component library for Ruby devs who want to build better, faster."
				end
			end
		end
	end

	Accordion do
		AccordionItem do
			AccordionTrigger do
				p(class: "font-medium") { "Can I use it with Rails?" }
				AccordionIcon()
			end

			AccordionContent do
				p(class: "text-sm pb-4") do
					"Yes, PhlexUI is pure Ruby and works great with Rails. It's a Ruby gem that you can install into your Rails app."
				end
			end
		end
	end
end

  end
end
