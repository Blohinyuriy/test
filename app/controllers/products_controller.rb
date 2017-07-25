class ProductsController < ApplicationController
  def create
    @product = Product.new resource_params

    resource.save!
  end

  private
  def resource
    @product
  end

  def resource_params
    params.permit(:name)
  end

  def collection
    @products ||= Product.all
  end
end
