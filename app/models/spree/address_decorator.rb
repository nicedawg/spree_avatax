Spree::Address.class_eval do
  after_save :avatax_compute_tax

  def avatax_compute_tax
    Spree::Order.incomplete.where(ship_address_id: id).each do |order|
      SpreeAvatax::SalesOrder.generate(order)
    end
  end
end
