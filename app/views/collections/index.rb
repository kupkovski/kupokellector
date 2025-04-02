# frozen_string_literal: true

class Views::Collections::Index < Views::Base
  def initialize(collections:)
    @collections = collections
  end

  def view_template
    ul do 
      @collections.each do |collection|
        li do
          link_to collection.name, collection_path(collection)
        end
      end
    end
  end
end
