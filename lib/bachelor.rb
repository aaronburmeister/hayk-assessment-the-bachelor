require 'pry'
def get_first_name_of_season_winner(data, season)
  data.map {|s,contestants|
    if s == season
      contestants.map {|person|
        if person["status"] == "Winner"
          return person["name"].split(" ")[0]
        end
      }
    end
  }
end

def get_contestant_name(data, occupation)
  # code here
  data.map {|s,contestants|
    contestants.map {|person|
      if person["occupation"] == occupation
        return person["name"]
      end
    }
  }
end

def count_contestants_by_hometown(data, hometown)
  # code here
  count = 0
  data.map {|s,contestants|
    contestants.map {|person|
      if person["hometown"] == hometown
        count += 1
      end
    }
  }
  count
end

def get_occupation(data, hometown)
  # code here
  data.map {|s,contestants|
    contestants.map {|person|
      if person["hometown"] == hometown
        return person["occupation"]
      end
    }
  }
end

def get_average_age_for_season(data, season)
  # code here
  ages = []
  data.map{|s,contestants|
    if s == season
      contestants.map{|person|
        ages << person["age"].to_i
      }
    end
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