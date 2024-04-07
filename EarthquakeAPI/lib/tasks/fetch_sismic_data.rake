# lib/tasks/fetch_sismic_data.rake
namespace :sismic do
    desc "Fetch sismic data from USGS"
    task fetch_data: :environment do
      require 'httparty'
      
      url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson'
      response = HTTParty.get(url)
      
      if response.code == 200
        data = JSON.parse(response.body)
        
        # Procesa los datos y haz lo que necesites con ellos
        data['features'].each do |feature|
          # Aquí puedes acceder a los campos que necesitas, como feature['properties']['mag'], etc.
          # Por ejemplo, puedes crear un nuevo registro en la base de datos con estos datos
          Feature.create(
            mag: feature['properties']['mag'],
            place: feature['properties']['place'],
            time: Time.at(feature['properties']['time'] / 1000), # Convertir milisegundos a segundos
            url: feature['properties']['url'],
            tsunami: feature['properties']['tsunami'],
            mag_type: feature['properties']['magType'],
            title: feature['properties']['title'],
            longitude: feature['geometry']['coordinates'][0],
            latitude: feature['geometry']['coordinates'][1]
          )
        end
        
        puts "Sismic data fetched and persisted successfully."
      else
        puts "Failed to fetch sismic data. HTTP Status: #{response.code}"
      end
    end
  end
  