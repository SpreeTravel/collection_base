module CollectionBase
  class Base

    attr_accessor :base_path

    def initialize (base_path)
      @base_path = base_path
    end

    def process_model(object)
      result = []
      files = load_json(object).to_a
      files.collect do |file|
        result << JSON.parse(open_json(file))
      end
      result
    end

    def process_libraries
      results = []
      lib_index = @base_path + '/libraries/index.json'
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

    def shared_base
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
      File.open(@base_path + '/index.json', mode: "r:utf-8").read
    rescue => e
      e.message
    end

    def open_sample(model)
      File.open(@base_path + "/support/sample/#{model}.json", mode: "r:utf-8").read
    rescue => e
      e.message
    end

    def load_json(object)
      Dir.glob("#{@base_path}/#{object}/*.json")
    rescue => e
      e.message
    end

    def load_libraries(lib)
      Dir.glob("#{@base_path}/libraries/#{lib}/*.json")
    rescue => e
      e.message
    end
  end
end