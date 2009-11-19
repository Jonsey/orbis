module Admin::PagesHelper
  def path(page)
    returning({}) do |hash|
      hash[:controller] = '/' + page.controller
      hash[:action] = page.action
      hash[:id] = controller.send(page.parameters) if page.action == 'show' || page.action == 'edit'
    end
  end
end
