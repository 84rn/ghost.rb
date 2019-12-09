#!/usr/bin/ruby

module Ghost
    # there is no ApplicationWindow in Gtk module of gtk3 gem
    # with module: gtk and class: ApplicationWindow the loader is
    # able to reference GtkApplicationWindow inside Gtk library
    # same with Gtk::Application

    class ApplicationWindow < Gtk::ApplicationWindow
        # register our class
        type_register

        def self.init
            # set the template to Glade file
            # this is a singleton method just for Ghost::ApplicationWindow
            # it overrides the original init() function from Gtk::ApplicationWindow
        end

        def initialize(app)
            super app
            # this is an instance method - each instance of the window can be initialized
            # with a different application
            set_title "Ghost.rb"
        end
    end
end





