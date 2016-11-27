class StoreController < ApplicationController
  def index
    @products=Product.all
  end

  def create
    name=params[:product][:name]
    price=params[:product][:price]
    description=params[:product][:description]
    quantity=params[:product][:quantity]

    product=Product.create(name:name,price:price,description:description,quantity:quantity)

    if(product.nil?)
      render 'new'
    else
      redirect_to products_path
    end
  end

  def update
    product=Product.find(params[:id])

    if(product.update(product_params).present?)
      redirect_to product_path(params[:id])
    else
      render 'edit'
    end
  end

  def product_params
    params.require(:product).permit(:name,:description,:price,:quantity)
  end

  def new
    @product=Product.new
  end

  def show
    @product=Product.find(params[:id])
  end

  def edit
    @product=Product.find(params[:id])
  end


end
