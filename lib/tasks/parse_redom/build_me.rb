require 'active_support/concern'

module ParseRedom
  module BuildMe
    extend ActiveSupport::Concern

    module ClassMethods
      def build_me(&block)
        record = new
        block.call(record) if block_given?
        if record.save
          puts "#{record.class.name} saved"
        else
          puts "error: #{record.class.name} not saved"
        end
      end
    end
  end
end
