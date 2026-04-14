module ApplicationHelper
  def status_badge(status)
    base = "inline-flex items-center rounded-full px-3 py-1 text-xs font-medium"

    case status
    when "active"
      "#{base} bg-green-100 text-green-800"
    when "inactive"
      "#{base} bg-slate-100 text-slate-700"
    when "vip"
      "#{base} bg-purple-100 text-purple-800"
    when "new"
      "#{base} bg-yellow-100 text-yellow-800"
    else
      "#{base} bg-gray-100 text-gray-700"
    end
  end
end
