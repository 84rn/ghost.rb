#!/usr/bin/ruby

require 'green_shoes'

module GUI
    class MainWindow
        @@instances_count = 0
        WIDTH = 300
        CONTROLS_WIDTH = 250
        CONTROLS_MARGIN = WIDTH / 2 - CONTROLS_WIDTH / 2
        TITLE = 'ghost.rb'

        def initialize
        end

        def get_default_server_types
            items = ['Any', 'Traffic', 'Torrent', 'Streaming']
        end

        def get_countries
            countries = { 'Polska' => ['Warszawa', 'Krakow'], 'Niemcy' => ['Dusseldorf', 'Berlin']}
        end
        
        def create
            # array
            server_types = self.get_default_server_types
            # hash: country => array of cities
            country_list = self.get_countries

            @app = Shoes.app title: TITLE,
                width: WIDTH do
                stack do
                    image 'logo.png', width: WIDTH
                    stack margin_left: CONTROLS_MARGIN do
                        stack width: CONTROLS_WIDTH do
                            flow do
                                stack width: 0.7 do
                                    @lb_countries = list_box width: 1.0,
                                      items: country_list.keys.clone().unshift('Any'),
                                      choose: 'Any' do |l|
                                        unless l.text == 'Any'
                                            @lb_cities.items = country_list[l.text].clone().unshift('Any')
                                            @lb_cities.choose(@lb_cities.items().at(0))
                                        else
                                            @lb_cities.items = ['Any']
                                            @lb_cities.choose(@lb_cities.items().at(0))
                                        end
                                    end
                                end
                                stack width: 0.3 do
                                    @el_country_code = edit_line width: 1.0
                                end
                            end
                            @lb_cities = list_box width: 1.0, items: ['Any'], choose: 'Any'
                            @lb_types = list_box width: 1.0, 
                                items: server_types,
                                choose: server_types[0]
                            @btn_connect = button 'Connect', width: 1.0 do
                            end
                        end
                        flow do
                        end
                    end
                    image 'logo.png', width: WIDTH
                end
            end
        end

        def set_connection_state(state)
        end

    end
end
