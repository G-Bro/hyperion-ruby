require 'faker'

ActiveRecord::Base.logger.silence do
  Event.transaction do
    50000.times do 
      Event.create(
        name: Faker::Verb.base,
        ref: Faker::Number.number(digits: 10),
        url: Url.create(
          host: Faker::Internet.domain_name,
          port: 443,
          path: Faker::Internet.slug,
          path_part_1: Faker::Internet.slug,
          path_part_2: Faker::Internet.slug,
          path_part_3: Faker::Internet.slug,
        )
      )
    end
  end
end

# event = Event.new(track_validated_params)
# event.save

# # render json: e
# url = Url.new(uri_parts)
# url.event = event
# url.save