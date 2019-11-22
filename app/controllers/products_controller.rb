class ProductsController < ApplicationController
  def index
    @products = Product.includes(:brand).to_a
  end

  def create
    @brands = Brand.order('brands.name ASC').all

    if request.method == "POST"
      if '' != params[:name] && '' != params[:brand]
        product = Product.new
        product.name = params[:name]
        product.brand_id = params[:brand]
        product.description = params[:description]
        product.save
        redirect_to :action => "index"
      else
        redirect_to :action => "index"
      end
    end
  end

  def read
    if nil != params[:id] && params[:id].to_i > 0
      product = Product.find_by(id: params[:id].to_i)
      @name = product.name
      @description = product.description
      @brand = Brand.find_by(id: product.brand_id).name
    else
      redirect_to :action => "index"
    end
  end

  def update
    if nil != params[:id] && params[:id].to_i > 0
      @brands = Brand.order('brands.name ASC').all
      product = Product.find_by(id: params[:id])

      @brand = product.brand_id
      @name = product.name
      @description = product.description
      @id = product.id

      if request.method == "POST"
        product.brand_id = params[:brand]
        product.name = params[:name]
        product.description = params[:description]
        product.save
        redirect_to :action => "index"
      end
    else
      redirect_to :action => "index"
    end
  end

  def delete
    if params[:id] != nil && params[:id].to_i > 0
      product = Product.find_by(id: params[:id].to_i)
      product.destroy
      redirect_to :action => "index"
    else
      redirect_to :action => "index"
    end
  end
end
