module CollectionBase

  class Base
    class << self
      def process_model(object)
        result = []
        files = load_json(object).to_a
        files.collect do |file|
          result << JSON.parse(open_json(file))
        end
       result
      end

      def process_libraries()
        results = []
        lib_index = Dir.glob('lib/*_collection/libraries/index.json').first
        libraries = JSON.parse(open_json(lib_index)).to_a
        libraries.collect do |lib|
          schemas = []
          files = load_libraries(lib["file"]).to_a
          files.collect do |file|
            hash = {"uri" => File.basename(file),
                    "schema" => open_json(file).to_s,
                    "library" => {
                        "_reference" => true,
                        "name" => lib["name"]
                    }
            }
            schemas << hash
          end
          results << {"name" => lib["name"], "schemas" => schemas}
        end
        results
      end

      def shared_base()
        JSON.parse(open_head)
      end

      def sample_data(file)
        JSON.parse(open_sample(file))
      end

      def open_json(file)
        File.open(file, mode: "r:utf-8").read
      rescue => e
        e.message
      end

      def open_head
        head_file = Dir.glob('lib/*_collection/index.json').first
        File.open(head_file, mode: "r:utf-8").read
      rescue => e
        e.message
      end

      def open_sample(model)
        File.open("spec/support/sample/#{model}.json", mode: "r:utf-8").read
      rescue => e
        e.message
      end

      def load_json(object)
        Dir.glob("lib/*_collection/#{object}/*.json")
      rescue => e
        e.message
      end

      def load_libraries(lib)
        Dir.glob("lib/*_collection/libraries/#{lib}/*.json")
      rescue => e
        e.message
      end
    end
  end
end