class ImportData
  require 'csv'
  
  def initialize
    @states_csv = Rails.root.join('lib/seed_csv/states.csv')
    @cities_csv = Rails.root.join('lib/seed_csv/cities.csv')
    @defaults = { 
      created_at: Time.now, 
      updated_at: Time.now 
    }
  end

  def insert
    insert_states
    insert_cities
  end

  private
  
  def insert_states
    begin
      states = get_states
      State.insert_all(states)
      puts "States created"
    rescue => e
      puts e.message
    end
  end

  def insert_cities
    begin
      cities = get_cities
      City.insert_all(cities)
      puts "Cities created"
    rescue => e
      puts e.message
    end
  end

  def get_states
    states = []
    CSV.foreach(@states_csv, headers: true) do |row|
      data = {
        name: row["name"], 
        code: row["code"]
      }
      states << data.merge(@defaults)
    end
    states
  end

  def get_cities
    cities = []
    CSV.foreach(@cities_csv, headers: true) do |row|
      state = State.find_by_id(row["state_id"])
      next if state.nil?
      
      data = {
        name: row["name"],
        code: row["code"],
        state_id: state.id
      }
      cities << data.merge(@defaults)
    end
    cities
  end
end