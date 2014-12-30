module Jekyll
  module Birthday
    def age(dob)
      now = Time.now.utc.to_date
      now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    end

    def is_birthday(dob)
      now = Time.now.utc.to_date
      dob.month == now.month && dob.day == now.day
    end
  end
end

Liquid::Template.register_filter(Jekyll::Birthday)
