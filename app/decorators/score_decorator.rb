class ScoreDecorator < Draper::Decorator
  delegate_all

  def total
    h.number_to_currency(calculator.total)
  end

  def total_percent(bosses_total)
    h.number_to_percentage(calculator.total_percent(bosses_total), precision: 0)
  end
end
