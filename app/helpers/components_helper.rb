module ComponentsHelper
  def orders_chart_data
    (1.year.ago.to_date..Date.today).map do |date|
      {
        purchased_at: date,
        price: Order.where("date(date_month) = ?", date).sum(:price)
      }
    end
  end
end
