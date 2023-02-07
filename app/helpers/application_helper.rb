# frozen_string_literal: true

module ApplicationHelper
  def absolute_link(link)
    return link if link.start_with?('http')
    "https://#{link}"
  end
end
