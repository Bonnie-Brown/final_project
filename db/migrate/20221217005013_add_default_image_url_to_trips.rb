class AddDefaultImageUrlToTrips < ActiveRecord::Migration[7.0]
  def change
    change_column_default :trips, :image_url, 'https://images.unsplash.com/photo-1488646953014-85cb44e25828?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80'
  end
end
