# frozen_string_literal: true

module ApplicationHelper
  SAFE_TAGS = %w(p br a img h1 h2 h3 h4 h5 h6 ul ol li strong em code pre)
  SAFE_ATTRIBUTES = %w(href src alt)

  def absolute_link(link)
    return link if link.start_with?('http')
    "https://#{link}"
  end

  def alerts_classes(type)
    "alert alert-#{type} alert-dismissible fade show"
  end

  def safe_tags
    SAFE_TAGS
  end

  def safe_attributes
    SAFE_ATTRIBUTES
  end
end
