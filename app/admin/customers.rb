ActiveAdmin.register Customer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :full_name, :phone_number, :email, :notes, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :phone_number, :email, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  filter :full_name 
  filter :email 
  filter :phone_number 
  filter :created_at
  
  show do
    attributes_table do
      row :id
      row :full_name
      row :image do |customer|
        if customer.image.attached?
          image_tag customer.image, style: "max-width: 200px;"
        else
          "No image uploaded"
        end
      end
      row :phone_number
      row :email
      row :notes
      row :created_at
      row :updated_at
    end
  end 

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end
end
