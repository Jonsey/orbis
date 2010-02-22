module AdminMenu

    def controller_menu(controllers)
      returning [] do |r|
        r << %(<ul>\r\n)
        controllers.each do |c|
          case
          when c.is_a?(Hash)
            c[:controller] = c[:label] if c[:controller].nil?
            label = c[:label]
            controller = c[:controller].downcase.gsub("/", "_")
          when c.is_a?(String)
            label =  c
            controller = c.downcase.gsub("/", "_")
          end
          r << %(<li)
          r << %( class='active') if is_current_controller?(controller)
          r << %(>)
          r << (link_to label, send("#{controller}_path"))
          r << "</li>\r\n"
        end
        r << %(</ul>\r\n)
      end
    end

    def action_menu
      returning [] do |r|
        r << %(<ul>\r\n)

        r << %(<li)
        r << %( class='active') if is_current_action?("index")
        r << %(>)
        r << (link_to "List #{model_name.pluralize}", index_path )
        r << "</li>\r\n"

        r << %(<li)
        r << %( class='active') if is_current_action?("new")
        r << %(>)
        r << (link_to "New #{model_name}", new_path)
        r << "</li>\r\n"

        if is_current_action?("edit")
          r << %(<li)
          r << %( class='active') if is_current_action?("edit")
          r << %(>)
          r << edit_label
          r << "</li>\r\n"
        end

        if is_current_action?("show")
          r << %(<li)
          r << %( class='active') if is_current_action?("show")
          r << %(>)
          r << show_label
          r << "</li>\r\n"
        end

        r << %(</ul>\r\n)
      end
    end

    private
    def index_path
      send("#{params[:controller].gsub("/", "_")}_path")
    end

    def new_path
      send("new_#{item_instance_name}_path")
    end

    def edit_path
      #edit_polymorphic_path(item)
      send("edit_#{item_instance_name}_path(#{item})")
    end

    def edit_label
      "Editing: " + item.to_s
    end

    def show_path
     # polymorphic_path(item)
      send("#{item_instance_name}_path(#{item})")
    end

    def show_label
      "Displaying: " + item.to_s
    end

    def model_name
      item_instance_name.split('_')[1]
    end

    def item
      eval("@#{model_name}")
    end

    def item_instance_name
      params[:controller].singularize.gsub("/", "_")
    end

    def is_current_controller?(name)
      params[:controller] == name.gsub("_", "/")
    end

    def is_current_action?(action)
      params[:action] == action
    end


end

