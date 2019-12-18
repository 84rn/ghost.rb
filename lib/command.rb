class Command
    attr_reader :cmd
    attr_accessor :params

    def initialize args
        @cmd = args[:cmd]
        @params = args[:params]
    end

    def run
        `#{command_string}`
    end

    def command_string
        [@cmd, @params].join(' ')
    end
end
