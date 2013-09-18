class Admin::ArticlesController < Admin::BaseController
  load_default_actions(:article)
  expose(:decorated_articles){articles.decorate}

  def update
    article = Article.find(params[:id])
    article_attributes = params[:article]

    if article_attributes && params[:conflict_resolution]
      case params[:conflict_resolution]
        when 'overwrite'
          article_attributes = article_attributes.dup
          article_attributes.delete(:lock_version)
        when 'cancel'
          redirect_to admin_articles_path
          return false
      end
    end

    article.attributes = article_attributes
    begin
      saved = false
      saved = article.save
    rescue ActiveRecord::StaleObjectError
      @conflict = true
    end

    if saved
      redirect_to admin_articles_path, notice: 'created'
    else
      render :edit
    end
  end
end