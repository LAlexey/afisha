class Admin::BaseController < ApplicationController
  layout 'admin'
  expose(:menu_items){ MenuItem.roots}
  before_filter :authenticate_user!

  class << self
    def load_default_actions(model_name)
      pluralized_name = model_name.to_s.pluralize
      index_url = "admin_#{pluralized_name}_url"

      expose(pluralized_name.to_sym)
      expose(model_name)

      define_method :create do
        if method(model_name).call.save
          redirect_to method(index_url).call, notice: 'created'
        else
          render :new
        end
      end

      define_method :update do
        if method(model_name).call.save
          redirect_to method(index_url).call, notice: 'updated'
        else
          render :edit
        end
      end

      define_method :destroy do
        method(model_name).call.destroy
        redirect_to method(index_url).call, notice: 'destroyed'
      end
    end
  end
end
