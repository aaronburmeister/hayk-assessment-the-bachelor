require 'pry'
#### Helpers
def search_contestants
  data.map {|s,contestants|
    contestants.map {|person|
      yield person
    }
  }
end

def search_contestants_by_season(season)
  data.map {|s,contestants|
    if s == season
      contestants.map {|person|
        yield person
      }
    end
  }
end

#### Tested Methods

def get_first_name_of_season_winner(data, season)
  search_contestants_by_season(season) { |person|
    if person["status"] == "Winner"
      return person["name"].split(" ")[0]
    end
  }
end

def get_contestant_name(data, occupation)
  # code here
  search_contestants { |person|
    if person["occupation"] == occupation
      return person["name"]
    end
  }
end

def count_contestants_by_hometown(data, hometown)
  # code here
  count = 0
  search_contestants {|person|
    if person["hometown"] == hometown
      count += 1
    end
  }
  count
end

def get_occupation(data, hometown)
  # code here
  search_contestants {|person|
    if person["hometown"] == hometown
      return person["occupation"]
    end
  }
end

def get_average_age_for_season(data, season)
  # code here
  ages = []
  search_contestants_by_season(season) {|person|
    ages << person["age"].to_i
  }
  return (ages.sum.to_f / ages.length).round
end


=begin
REFERENCE: Hash Structure
------------------
{
  Season_Number: [
    Contestant {
      "Name": ,
      "Age": ,
      "Hometown": ,
      "Occupation": ,
      "Status": 
    }
  ],
  Next_Season: [
    Contestant {},
    Contestant {}
  ]
}
=end