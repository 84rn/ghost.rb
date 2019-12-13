#!/usr/bin/ruby

=begin
        Usage:  ./server_grabber.rb                     # list to stdout
                ./server_grabber.rb |tee server.list    # list to stdout and ./server.list
                ./server_grabber.rb >server.list        # list to ./server.list

        The program spits out the list to stdout.
        Example list downloaded on 12.12.19 is provided
        in the  cyberghost.list

        TODO:

        - Add listing of streaming services servers
=end

module CyberGhost
    module App
        class Response
            def initialize text
                @raw_text = text
                @lines = @raw_text.split(/\n/)
            end

            def to_a
                @lines
            end

            def to_s
                @raw_text
            end
        end

        class TableResponse
            HEADER_INDEX = 1
            CONTENT_INDEX = 3

            attr_reader :headers
            attr_reader :rows

            def initialize text
                @response = Response.new text
                @headers = raw_row_to_a @response.to_a[HEADER_INDEX]
                @rows = []
                @response.to_a[CONTENT_INDEX..-2].each do |row|
                    @rows << (raw_row_to_a row)
                end
            end

            def columns
                cols = []
                for i in 0...headers.count do
                    col = []
                    rows.each do |row|
                        col << row[i]
                    end
                    cols << col
                end
                cols
            end

            private

            def raw_row_to_a row
                cleaned = []
                row.split('|').each do |cell|
                    txt = cell.strip
                    cleaned << txt unless txt.empty?
                end
                cleaned
            end
        end

        class ServerListGrabber
            CMD = 'cyberghostvpn'
            HEADER_HEIGHT = 3
            FOOTER_HEIGHT = 2
            CONTENT_RANGE = (HEADER_HEIGHT..-FOOTER_HEIGHT)

            def initialize
            end

            def grab
                dl_counter = {country: 0, city: 0, server: 0}

                # Download all country codes
                country_cmd = [CMD, '--country-code'].join(' ')
                country_table = `#{country_cmd}`
                country_table.split(/\n/)[CONTENT_RANGE].each do |cc_entry|
                    /([[:alpha:]][[[:alpha:]] ]+[[:alpha:]])\s+\|\s+([A-Z]{2})/.match(cc_entry) do |cc_match|
                        country, cc = cc_match[1..2]
                        dl_counter[:country] += 1
                        printf "[%02d] %s - %s\n", dl_counter[:country], country, cc
                        # Find all cities within country
                        city_cmd = [country_cmd, %("#{cc}"), '--city'].join(' ')
                        city_table = `#{city_cmd}`
                        city_table.split(/\n/)[CONTENT_RANGE].each do |city_entry|
                            /[[:alpha:]][[[:alpha:]] ]+[[:alpha:]]/.match(city_entry) do |city_match|
                                dl_counter[:city] += 1
                                printf "\t[%03d] %s\n", dl_counter[:city], city_match
                                # Download all servers in city
                                server_cmd = [city_cmd, %("#{city_match}"), '--servers'].join(' ')
                                server_table = `#{server_cmd}`
                                server_table.split(/\n/)[CONTENT_RANGE].each do |server_entry|
                                    /[a-z][\w-]+\d+/.match(server_entry) do |server_match|
                                        dl_counter[:server] += 1
                                        printf "\t\t[%04d] %s\n", dl_counter[:server], server_match
                                    end
                                end
                            end
                        end
                    end
                end
                puts "----------"
                puts "Countries: #{dl_counter[:country]}"
                puts "Cities: #{dl_counter[:city]}"
                puts "Servers: #{dl_counter[:server]}"
            end
        end
    end
end

