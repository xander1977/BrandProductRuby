class BrandsController < ApplicationController
  def index
    @brands = Brand.order('brands.name ASC').all
  end

  def create
    if request.method == "POST"
      if nil != params[:name]
        brand = Brand.new
        brand.name = params[:name]
        brand.save
        redirect_to :action => "index"
      end
    end
  end

  def read
    if nil != params[:id] && params[:id].to_i > 0
      @name = Brand.find_by(id: params[:id].to_i).name
    else
      redirect_to :action => "index"
    end
  end

  def update
    if '' != params[:id] && params[:id].to_i > 0
      brand = Brand.find_by(id: params[:id])
      @name = brand.name
      @id = brand.id

      if request.method == "POST"
        if nil != params[:name]
          brand = Brand.find_by(id: params[:id])
          brand.name = params[:name]
          brand.save
          redirect_to :action => "index"
        else
          redirect_to :action => "index"
        end
      end
    else
      redirect_to :action => "index"
    end
  end

  def delete
    if params[:id] != nil && params[:id].to_i > 0
      brand = Brand.find_by(id: params[:id].to_i)
      brand.destroy
      redirect_to :action => "index"
    else
      redirect_to :action => "index"
    end
  end
end
