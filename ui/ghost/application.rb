#!/usr/bin/ruby

require 'gtk3'
require_relative 'application_window'

module Ghost
    class Application < Gtk::Application
        @@app_id = 'org.gnome2.ghostapp'

        def initialize
            super @@app_id, :flags_none

            # attach showing the window to 'activate' event
            signal_connect :activate do |app|
                window = Ghost::ApplicationWindow.new application: app
                window.present
            end
        end
    end
end
