module ApplicationHelper

  def use_tinymce
    @content_for_tinymce = ""
    content_for :tinymce do
      javascript_include_tag "tiny_mce/tiny_mce"
    end
    @content_for_tinymce_init = ""
    content_for :tinymce_init do
      javascript_include_tag "mce_editor"
    end
  end

  def my_page_title(title)
    content_for :page_title do
      page_title(title, 'H2')
    end
  end

  def link_tree(collection)
    render_tree_from(collection, nil) do |item|
      link_to(item.name, edit_polymorphic_path([:admin, item]))
    end
  end

  def render_tree_from(tree, root)
    return nil if tree.empty?

    ret = "<ul>"
    tree.each do |node|
      if(node.parent == root)
        ret += "<li>"
        ret += yield node
        ret += render_tree_from(tree, node) { |n| yield n } unless node.children.empty?
        ret += "</li>"
      end
    end
    ret += "</ul>"
  end

  def render_nav_main
    nav_main if current_user
  end

  def render_nav_sub
    nav_sub
  end

  def nav_main
    Page.create_pages unless Page.root

    pages = Page.root.children
    returning [] do |r|
      r << %(<ul>\r\n)
      pages.each do |p|
        r << li(p.name, path(p), p)
      end
    r << %( </ul>\r\n)
    end
  end

  def nav_sub
    returning [] do |r|
      r << %(<ul>\r\n)
      if current_menu
        pages = current_menu[:main].children
        pages.each do |p|
          r << li(p.name, path(p), p)
        end
      end
      r << %( </ul>\r\n)
    end
  end

  def current_menu
    page = Page.find(:last, :conditions => [ 'controller = ? and action = ?', params[:controller], controller.action_name ] )
    if page
      returning({}) do |menu|
        menu[:main] = page.self_and_ancestors[1]
        menu[:sub] = page.self_and_ancestors[2]
      end
    end
  end

  def li_tab(text, path)
    returning [] do |arr|
      arr << %(<li)
      arr << %( class='active') if path == controller.request.request_uri
      arr << %(>)
      arr << link_to(text, path, :class => 'tab')
      arr << %(</li>\r\n)
    end unless current_menu.nil?
  end

  def li(text, path, p)
    returning [] do |arr|
      arr << %(<li)
      arr << %( class='active')  if current_menu[:main] == p || current_menu[:sub] == p
      arr << %(>)
      arr << link_to(text, path)
      arr << %(</li>\r\n)
    end unless current_menu.nil?
  end

  def image_link_to(image_source, title, url_options, image_options = nil, html_options = {})
    image_options ||= {:class => 'image-submit'}
    image_options.update :alt => title, :title => title
    html_options.merge!(:title => title)
    link_to image_tag(image_source, image_options), url_options, html_options
  end

end
