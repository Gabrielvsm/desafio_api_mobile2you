module Serializer
  class << self
    def json_response(filters)
      title_array = Title.all
      return { error: 'Collection of titles is empty' } if title_array.empty?

      unless filters.empty?
        query = filters.map { |k, v| [k.to_sym, v.titleize] }.to_h
        query.each do |key, value|
          # Problem with 'type', will have to rename the model and its associations later
          if key.to_s == 'type'
            title_array = title_array.joins(key).merge(key.to_s.camelize.constantize.where("#{key.to_s}_name".to_sym => value))
          else
            title_array = title_array.joins(key).merge(key.to_s.camelize.constantize.where(key => value))
          end
        end
      end

      title_array.map do |title|
        {
          id: title[:id],
          title: title[:title],
          genre: title.type[:type_name],
          year: title.release_year[:release_year],
          country: title.country[:country],
          published_at: title.date_added,
          description: title[:description]
        }
      end
    end
  end
end
