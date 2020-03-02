require 'yaml'
config_path = File.join(Dir.home, ".aliases.yaml")
aliases_path = File.join(Dir.home, ".aliases.sh")

class Alias
    attr_accessor :key, :value

    def initialize(key, value)
        @key = key
        @value = value
    end

    def to_h
        { key => value }
    end
end

class AliasStore
    attr_reader :aliases_path, :config_path, :aliases

    def initialize(aliases_path, config_path)
        @aliases_path = aliases_path
        @config_path = config_path
        @aliases = parse_file(load_file)
    end

    def save
        save_file(to_h)
    end

    def write_aliases
        if aliases.nil?
            puts "No aliases found"
            return
        end

        File.open(aliases_path, 'w') do |file|
            aliases.each do |a|
                file.write("alias #{a.key}='#{a.value}'\n")
                puts "alias #{a.key}='#{a.value}'"
            end
        end
    end

    def to_h
        h = {}
        aliases.each do |a|
            h[a.key] = a.value
        end
        h
    end

    private

    def load_file
        if File.file?(config_path)
            YAML.load_file(config_path)
        end
    end

    def parse_file(data)
        return if data.nil?
        aliases = []
        data.each do |k,v|
            aliases << Alias.new(k,v)
        end
        aliases
    end

    def save_file(data)
        File.open(config_path, "w") do |file|
            file.write(data.to_yaml)
        end
    end

end

def update_aliases(aliases_path, config_path)
    store = AliasStore.new(aliases_path, config_path)
    store.write_aliases
    store.save
end    

update_aliases(aliases_path, config_path)


