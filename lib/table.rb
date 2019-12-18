=begin

    -- These are some helpful classes witch may be deleted in the next commit --


class TableCell
    attr_reader :value

    def initialize args
        @value = args[:value]
    end

    def to_s
        @value
    end
end

class TableCellSet
    attr_reader :data

    def initialize cells
        @data = cells
    end

    def to_s
        @data.join("\n")
    end

    def [] ix
        @data[ix]
    end

    def count
        @data.count
    end
end

class TableColumn
    attr_reader :cells, :name

    def initialize args
        @name = args[:name]
        @cells = TableCellSet.new(args[:data])
    end

    def to_s
        puts @name
        @cells.to_s
    end
end

class TableRow
    attr_reader :cells

    def initialize args
        @cells = TableCellSet.new(args[:data])
    end

    def to_s
        @cells.to_s
    end
end
=end

class Table
    attr_accessor :headers, :rows, :columns

    def initialize args
        @headers = args[:headers]
        @rows = args[:rows]
    end

    def columns
        cols = []
        for i in 0...@headers.count
            cells = []
            @rows.each do |row|
                cells << row[i]
            end
            cols << cells
        end
        [cols]
    end
end

class TableParser
    attr_reader :text, :table

    def initialize
        @lines = []
    end

    def parse text
        init(text)
        @table = create_table(parse_headers, parse_data)
        @table
    end

    private

    def header_row_ix
        1
    end

    def data_start_ix
        3
    end

    def data_end_ix
        -2
    end

    def data_range
        (data_start_ix..data_end_ix)
    end

    def column_offset
        1
    end

    def line_delimiter
        /\n/
    end

    def split_lines
        @lines = @text.split(line_delimiter)
    end

    def create_table headers, data
        Table.new(headers: headers, rows: data)
    end

    def init text
        @text = text
        split_lines
    end

    def parse_headers
        parse_row(@lines[header_row_ix])
    end

    def parse_data
        data = []
        @lines[data_range].each do |row|
            data << parse_row(row)
        end
        data[column_offset..-1]
    end

    def parse_row row
        cells = []
        row.split('|').each do |cell|
            cells << cell.strip
        end
        cells[column_offset..-1]
    end
end

class TableWrapper

    def initialize table
        @table = table
    end
end

class CityTableWrapper

    def names_header_ix
        1
    end

    def names
    end
end


=begin
class CountryTableWrapper
end

class ServerTableWrapper
end

class StreamingTableWrapper
end
=end

