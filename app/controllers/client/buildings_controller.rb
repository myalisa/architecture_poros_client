class Client::BuildingsController < ApplicationController
  def index
    response = HTTP.get("http://localhost:3000/api/buildings")
    @buildings = response.parse
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
                     name: params[:name],
                     address: params[:address],
                     height: params[:height],
                     construction_date: params[:construction_date],
                     architect: params[:architect]
                    }
                    
    response = HTTP.post(
                         "http://localhost:3000/api/buildings", 
                         form: client_params
                        )

    building = response.parse
    redirect_to "/client/buildings/#{building['id']}"
  end

  def show
    response = HTTP.get("http://localhost:3000/api/buildings/#{params[:id]}")
    @building = response.parse
    render 'show.html.erb'
  end

  def edit
    response = HTTP.get("http://localhost:3000/api/buildings/#{params[:id]}")
    @building = response.parse
    render "edit.html.erb"
  end

  def update
    client_params = {
                     name: params[:name],
                     address: params[:address],
                     height: params[:height],
                     construction_date: params[:construction_date],
                     architect: params[:architect]
                    }

    response = HTTP.patch(
                          "http://localhost:3000/api/buildings/#{params[:id]}", 
                          form: client_params
                          )

    redirect_to "/client/buildings/#{params[:id]}"
  end

  def destroy
    response = HTTP.delete("http://localhost:3000/api/buildings/#{params[:id]}")
    redirect_to "/"
  end
end
