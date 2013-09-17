module TopList
  class Admin::TopListItemsController < TopList::ApplicationController
    def update
      top_list_item = TopListItem.find(params[:id])
      top_list_item.attributes = params[:thing]
      top_list_item.save

      render nothing: true
    end

    def toggle_position
      model = params[:klass].classify.demodulize.safe_constantize
      record = model.find(params[:id])
      record.toggle_top_position if record.respond_to? :toggle_top_position

      render nothing: true
    end

    # GET /top_list/model_name
    def show
      @model = params[:model].try(:safe_constantize)
      if @model
        #@models = @model.positioned.decorate
        @models = @model.scoped.decorate
      end
      #self.articles = ArticlesDecorator.decorate(Article.positioned_articles)
    end
  end
end

