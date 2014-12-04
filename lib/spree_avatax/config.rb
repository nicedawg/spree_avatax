require 'avalara'

module SpreeAvatax
  class Config
    class << self

      [:username, :username=, :password, :password=, :endpoint, :endpoint=].each do |config|
        delegate config, to: ::Avalara
      end

      attr_accessor :company_code
      attr_accessor :use_production_account
      # These error handlers should be objects that respond to "call" and accept an order and an
      # exception as arguments.  This allows you to ignore certain errors or handle them in
      # specific ways.
      attr_accessor :sales_order_generate_error_handler
      attr_accessor :sales_invoice_generate_error_handler
      attr_accessor :sales_invoice_commit_error_handler
      attr_accessor :sales_invoice_cancel_error_handler
    end

    self.use_production_account = false
  end
end
