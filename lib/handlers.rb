module Handlers
  module CsvHandler
    class << self
      def handle_csv(csv_file)
        return false unless csv_file.original_filename.match(/.*\.csv$/)

        csv_data = CSV.parse(File.read(csv_file), headers: true)
        csv_data.each do |item|
          type = get_instance(Type, item['type'], :type_name)
          country = get_instance(Country, item['country'], :name)
          release = get_instance(ReleaseYear, item['release_year'], :year)
          rating = get_instance(Rating, item['rating'], :rating_type)
          title = Title.create!(
            show_id: item['show_id'],
            title: item['title'],
            date_added: item['date_added'],
            duration: item['duration'],
            description: item['description'],
            type: type,
            country: country,
            release_year: release,
            rating: rating
          )
          title.save

          actors = handle_arrays(item['cast'], Actor, :name)
          check_empty(actors, TitleActor, :actor, title)
          categories = handle_arrays(item['listed_in'], Category, :category_name)
          check_empty(categories, TitleCategory, :category, title)
          directors = handle_arrays(item['director'], Director, :name)
          check_empty(directors, TitleDirector, :director, title)
        end
      end

      private

      def get_instance(object, item, symbol)
        return object.create(symbol => 'Nan') if item.nil?

        query = object.where(symbol => item)
        query.empty? ? object.create(symbol => item) : query.first
      end

      def handle_arrays(array, object, symbol)
        return [] if array.nil? || array.empty?

        result = []
        array.split(', ').each do |obj|
          result << get_instance(object, obj, symbol)
        end

        result
      end

      def check_empty(array, object, symbol, title)
        unless array.empty?
          array.each do |a|
            object.create(symbol => a, title: title)
          end
        end
      end
    end
  end
end
