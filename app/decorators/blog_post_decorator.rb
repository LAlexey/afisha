class BlogPostDecorator < BaseDecorator
  delegate_all

  def additional_info
    result = object.blog_post_addition_emotions.to_s

    section = object.blog_post_addition.try(:section)
    result += " - #{section.title}" if section
    result
  end

  def author_info
    author = object.author
    author.email if author
  end
end