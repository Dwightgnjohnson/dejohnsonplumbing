module ApplicationHelper

  def readable_date(d)
    d = d.to_date unless d.is_a?(Date)
    d.readable_inspect
  end

  def tel_to(text)
    groups = text.to_s.scan(/(?:^\+)?\d+/)
    link_to text, "tel:#{groups.join '-'}"
  end
end
