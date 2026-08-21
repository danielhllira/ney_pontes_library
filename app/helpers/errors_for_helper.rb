require "action_view/helpers"

module ErrorsForHelper
  def errors_for(object, *attributes)
    return unless object.respond_to?(:errors)

    messages = attributes.map { |attribute| object.errors.messages[attribute] }.flatten.uniq.compact

    return if messages.empty?

    content_tag(:div, class: "invalid-feedback d-block") do
      messages.join(", ")
    end
  end

  module FormBuilderMethods
    # rubocop:disable Rails/HelperInstanceVariable
    def errors_for(*attributes)
      object = @object || @template.assigns[@object_name.to_s] || @object_name
      @template.errors_for(object, *attributes)
    end
    # rubocop:enable Rails/HelperInstanceVariable
  end
end

module ActionView
  module Helpers
    include ErrorsForHelper

    class FormBuilder
      include ErrorsForHelper::FormBuilderMethods
    end
  end
end
