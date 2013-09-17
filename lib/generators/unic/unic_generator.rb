require 'rails/generators'
require 'rails/generators/generated_attribute'

module Unic
  module Generators
    class UnicGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      argument :controller_path,    :type => :string
      #argument :controller_path,    :type => :string
      #argument :model_name,         :type => :string, :required => false
      #argument :layout,             :type => :string, :default => "application",
      #         :banner => "Specify application layout"

      #class_option :excluded_columns, :type => :array, :required => false

      def initialize(args, *options)
        super(args, *options)

        @model_name = controller_path
        @controller_file_path = collection_name
      end

      def resource_name
        @resource_name ||= @model_name.underscore
      end

      def collection_name
        @collection_name ||= resource_name.pluralize
      end

      def generate_views
        views = {
            "index.html.#{ext}"                 => File.join('app/views', @controller_file_path, "index.html.#{ext}")#,
            #"new.html.#{ext}"                   => File.join('app/views', @controller_file_path, "new.html.#{ext}"),
            #"edit.html.#{ext}"                  => File.join('app/views', @controller_file_path, "edit.html.#{ext}"),
            #"#{form_builder}_form.html.#{ext}"  => File.join('app/views', @controller_file_path, "_form.html.#{ext}"),
            #"show.html.#{ext}"                  => File.join('app/views', @controller_file_path, "show.html.#{ext}")
        }

        views.each do |template_name, output_path|
          template template_name, output_path
        end
      end

      def ext
        ::Rails.application.config.generators.options[:rails][:template_engine] || :erb
      end

      def columns
        @columns ||= retrieve_columns
      end

      def retrieve_columns
        if defined?(ActiveRecord) == "constant" && ActiveRecord.class == Module && @model_name.constantize.respond_to?(:columns)
          rescue_block ActiveRecord::StatementInvalid do
            @model_name.constantize.columns
          end
        else
          rescue_block do
            @model_name.constantize.fields.map {|c| c[1] }
          end
        end
      end

      def rescue_block(exception=Exception)
        yield if block_given?
      rescue exception => e
        say e.message, :red
        exit
      end
    end
  end
end



