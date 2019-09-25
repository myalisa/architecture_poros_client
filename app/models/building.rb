class Building
  attr_accessor :name, :address, :construction_date, :height, :architect, :id
  def initialize(input_options)
    @id = input_options["id"]
    @name = input_options["name"]
    @address = input_options["address"]
    @height = input_options["height"]
    @construction_date = input_options["construction_date"]
    @architect = input_options["architect"]
  end

  def self.find(building_id)
    response = HTTP.get("http://localhost:3000/api/buildings/#{building_id}")
    hash_data = response.parse
    Building.new(hash_data)
  end


  def self.all
    response = HTTP.get("http://localhost:3000/api/buildings")

    response.parse.map do |hash_data|
      Building.new(hash_data)
    end

  end

  def self.create(client_params)
    response = HTTP.post(
                          "http://localhost:3000/api/buildings",
                            form: client_params
                          )
    
    
    Building.new(response.parse)
  end

  def update(client_params)
    response = HTTP.patch(
                            "http://localhost:3000/api/buildings/#{id}",
                            form: client_params

                            )

    @name = response.parse["name"]
    @address = response.parse["address"]
    @height = response.parse["height"]
    @construction_date = response.parse["construction_date"]
    @architect = response.parse["architect"]
  end

  def destroy
    response = HTTP.delete("http://localhost:3000/api/buildings/#{id}")
  end

end


 