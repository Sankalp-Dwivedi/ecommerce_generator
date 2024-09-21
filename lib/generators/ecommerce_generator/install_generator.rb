require 'rails/generators'

module EcommerceGenerator
  class InstallGenerator < Rails::Generators::Base
    # puts "Source root: #{source_root}"  # Add this line to debug the source path

    source_root File.expand_path('templates', __dir__)

    # Option to skip generating views
    class_option :skip_views, type: :boolean, default: false, description: "Skip generating views"

    # Copies migrations to the host app
    # def copy_migrations
    #   rake("railties:install:migrations", "FROM=ecommerce")
    # end
    # def copy_migrations
    #   directory "migrations", "db/migrate"
    # end

     # Copies model files to the host app
    def create_models
      puts "Copying model files..."
      copy_file 'models/product_category.rb.tt', 'app/models/product_category.rb'
      copy_file 'models/product.rb.tt', 'app/models/product.rb'
      copy_file 'models/property_key.rb.tt', 'app/models/property_key.rb'
      copy_file 'models/property_value.rb.tt', 'app/models/property_value.rb'
      copy_file 'models/discount.rb.tt', 'app/models/discount.rb'
      copy_file 'models/product_discount.rb.tt', 'app/models/product_discount.rb'
      copy_file 'models/order.rb.tt', 'app/models/order.rb'
    end

    # Copies controller files to the host app
    def create_controllers
      copy_file 'controllers/products_controller.rb.tt', 'app/controllers/products_controller.rb'
    end

    # Copies view files to the host app
    def create_views
      directory 'views', 'app/views'
    end

    # Adds routes to the host app's routes file
    def add_routes
      # route "resources :product_categories"
      route "resources :products"
    end

    # Adds necessary gems like Rails Admin
    def add_gems
      gem 'rails_admin'
    end

    # Final instructions
    def post_install_instructions
      puts "Run 'rails db:migrate' to apply the migrations."
      puts "Then, start the server and visit '/admin' to access Rails Admin."
    end

    # Generate migrations
    def create_migrations
      template 'migrations/create_discounts.rb', 'db/migrate/create_discounts.rb'
      template 'migrations/create_orders.rb', 'db/migrate/create_orders.rb'
      template 'migrations/create_product_categories.rb', 'db/migrate/create_product_categories.rb'
      template 'migrations/create_product_discount.rb', 'db/migrate/create_product_discount.rb'
      template 'migrations/create_products.rb', 'db/migrate/create_products.rb'
      template 'migrations/create_property_keys.rb', 'db/migrate/create_property_keys.rb'
      template 'migrations/create_property_values.rb', 'db/migrate/create_property_values.rb'
    end

    # # Generate views unless skipped
    # def create_views
    #   unless options[:skip_views]
    #     template 'views/products_index.html.erb', 'app/views/products/index.html.erb'
    #   end
    # end

    # def create_controllers
    #   template 'controllers/products_controller.rb', 'app/controllers/products_controller.rb'
    # end

    # def add_routes
    #   route 'resources :products'
    #   route 'resources :orders'
    # end

    def create_rails_admin_initializer
      template 'config/initializers/rails_admin.rb', 'config/initializers/rails_admin.rb'
    end


  end
end
