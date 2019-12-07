#!/usr/bin/ruby

require_relative 'lib/gui'

class GhostApp
    @@instances = 0

    def initialize
       # initialize main window
       @main_window = GUI::MainWindow.new
       

       # create system information object

       # create url handler

       # create parser
    end

    def run
        # get info from http - servers
        # check status
        
        # show window
        @main_window.create
    end
end

app = GhostApp.new
app.run
