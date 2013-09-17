class Admin::BlogPostsController < Admin::BaseController
  load_default_actions(:blog_post)
  expose(:decorated_blog_posts){ blog_posts.with_addition.decorate }
end
