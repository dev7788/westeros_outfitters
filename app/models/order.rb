class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  validates :amount, presence: true
  validates :user_id, presence: true
  validates :status, presence: true

  enum status: %w(Ordered Paid Cancelled Completed)

  def add_order_items(cart)
    cart.contents.each do |item_id, qty|
      item = Item.find(item_id)
      self.order_items.create(item_id: item_id, quantity: qty, sub_total: item.price * qty)
    end
  end

  serialize :notification_params, Hash
    def paypal_url(return_path)
      values = {
          business: "ematthewcampbell@gmail.com",
          cmd: "_xclick",
          upload: 1,
          return: "#{Rails.application.secrets.app_host}#{return_path}",
          invoice: id,
          amount: self.amount,
          order_number: self.id,
          quantity: '1',
          notify_url: "#{Rails.application.secrets.app_host}/hook"
      }
      
      "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
    end
end
