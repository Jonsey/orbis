module ActionView
  module Helpers
    module FormHelper
      def formatted_form_for(record_or_name_or_array, *args, &proc)
        options = args.extract_options!
        form_for(record_or_name_or_array, *(args << options.merge(:builder => FormattingFormBuilder)), &proc)
      end
    end

    class FormattingFormBuilder < FormBuilder
      helpers = field_helpers +
        %w{date_select datetime_select time_select} +
        %w{collection_select select country_select time_zone_select} -
        %w{hidden_field label fields_for} # Don't decorate these

      helpers.each do |name|
        define_method(name) do |field, *args|
          options = args.last.is_a?(Hash) ? args.pop : {}
          label = label(field, options.delete[:label], :class => options.delete[:label_class])
          @template.content_tag(:div, label + super, :class => 'cell')  #wrap in a cell
        end
      end
    end
  end
end
