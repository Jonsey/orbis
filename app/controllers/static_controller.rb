class StaticController < ApplicationController
  layout 'application'

  NO_CACHE = [
    'static/about/website',
  ]

  def index
    if template_exists? path = 'static/' + params[:path].join('/')
      render_cached path
    elsif template_exists? path += '/index'
      render_cached path
    else
      raise ::ActionController::RoutingError,
            "Recognition failed for #{request.path.inspect}"
    end
  end

private

  def render_cached(path)
    if NO_CACHE.include? path
      render :template => path
    else
      key = path.gsub('/', '-')
      unless content = read_fragment(key)
        content = render_to_string :template => path, :layout => false
        write_fragment(key, content)
      end
      render :text => content, :layout => true
    end
  end

  def template_exists?(path)
    self.view_paths.find_template(path, response.template.template_format)
  rescue ActionView::MissingTemplate
    false
  end
end

