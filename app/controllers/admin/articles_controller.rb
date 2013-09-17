class Admin::ArticlesController < Admin::BaseController
  load_default_actions(:article)
  expose(:decorated_articles){articles.decorate}
end
