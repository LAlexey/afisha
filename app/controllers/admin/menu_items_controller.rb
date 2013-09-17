class Admin::MenuItemsController < Admin::BaseController
  include TheSortableTreeController::Rebuild

  expose(:current_menu_item, model: :menu_item)
  expose(:all_menu_items, model: :menu_item)

  def edit
    self.menu_items = menu_items.where(MenuItem.arel_table[:id].not_in(current_menu_item.id))
  end

  def create
    if current_menu_item.save
      redirect_to admin_menu_items_path, notice: 'menu_item was successfully created.'
    else
      render action: new_admin_menu_item_path
    end
  end

  def update
    if current_menu_item.save
      redirect_to admin_menu_items_path, notice: 'menu_item was successfully updated.'
    else
      render action: edit_admin_menu_item_path(menu_item)
    end
  end

  def destroy
    current_menu_item.destroy
    redirect_to admin_menu_items_path
  end
end
