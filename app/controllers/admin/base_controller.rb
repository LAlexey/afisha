class Admin::BaseController < ApplicationController
  layout 'admin'
  expose(:menu_items){ MenuItem.roots}
  before_filter :authenticate_user!

  class << self
    def load_default_actions(model_name, options={})
      pluralized_name = model_name.to_s.pluralize
      index_url = "admin_#{pluralized_name}_url"

      expose(pluralized_name.to_sym)
      expose(model_name)
      
      def_default_methods(model_name, index_url, options)
    end

    private
    def def_default_methods(model_name, index_url, options={})
      actions = [:create, :update, :destroy]
      only_actions = Array.wrap(options[:only])
      except_actions = Array.wrap(options[:except])

      if only_actions.present?
        actions &= only_actions
      elsif except_actions.present?
        actions -= except_actions
      end

      actions.each do |a|
        method("define_#{a}").call(model_name, index_url)
      end
    end

    def define_create(model_name, index_url)
      define_method :create do
        if method(model_name).call.save
          redirect_to method(index_url).call, notice: 'created'
        else
          render :new
        end
      end
    end

    def define_update(model_name, index_url)
      define_method :update do
        if method(model_name).call.save
          redirect_to method(index_url).call, notice: 'updated'
        else
          flash[:error] = 'error'
          render :edit
        end
      end
    end

    def define_destroy(model_name, index_url)
      define_method :destroy do
        method(model_name).call.destroy
        redirect_to method(index_url).call, notice: 'destroyed'
      end
    end
  end
end
