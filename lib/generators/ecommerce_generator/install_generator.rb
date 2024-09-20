require 'rails/generators'

module EcommerceGenerator
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    # Option to skip generating views
    class_option :skip_views, type: :boolean, default: false, description: "Skip generating views"

    # Generate migrations
    def create_migrations
      template 'migrations/create_products.rb', 'db/migrate/create_products.rb'
      template 'migrations/create_categories.rb', 'db/migrate/create_categories.rb'
      template 'migrations/create_orders.rb', 'db/migrate/create_orders.rb'
    end

    # Generate views unless skipped
    def create_views
      unless options[:skip_views]
        template 'views/products_index.html.erb', 'app/views/products/index.html.erb'
      end
    end

    def create_controllers
      template 'controllers/products_controller.rb', 'app/controllers/products_controller.rb'
    end

    def add_routes
      route 'resources :products'
      route 'resources :orders'
    end

    def create_rails_admin_initializer
      template 'config/initializers/rails_admin.rb', 'config/initializers/rails_admin.rb'
    end


  end
end
