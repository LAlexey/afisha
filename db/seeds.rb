#encoding: utf-8

User.first_or_create!(email: 'l@l.com', password: 'qweasdzxc', password_confirmation: 'qweasdzxc', roles: %w(admin))

MenuItem.create(name: 'Управление меню', url: '/admin/menu_items', condition: '/admin/menu_items')
MenuItem.create(name: 'Места', url: '/admin/places', condition: '/admin/places')
MenuItem.create(name: 'Статьи', url: '/admin/articles', condition: '/admin/articles')
MenuItem.create(name: 'Блоги', url: '/admin/blog_posts', condition: '/admin/blog_posts')
MenuItem.create(name: 'Разделы', url: '/admin/sections', condition: '/admin/sections')