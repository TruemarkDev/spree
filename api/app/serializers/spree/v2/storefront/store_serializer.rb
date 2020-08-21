module Spree
  module V2
    module Storefront
      class StoreSerializer < BaseSerializer
        set_type :store

        attributes :name, :url, :meta_description, :meta_keywords, :seo_title, :mail_from_address, :default_currency, :code, :default, :supported_currencies, :facebook, :twitter, :instagram, :default_locale, :customer_support_email, :default_country_id, :description, :address, :contact_phone, :contact_email, :new_order_notifications_email
      end
    end
  end
end
