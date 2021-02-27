class MySelectQuery
    def initialize(csv_content)
        @hash_array = []
        lines = csv_content.split(/\n/) 
        keys = lines.shift.split(',') 
        lines.each{|line|
            line_hash = {} 
            values = line.scan(/"[^"]*"|[^,]+/) 
            for x in 0..values.length-1 do 
                line_hash[keys[x]] = values[x]
            end
            @hash_array << line_hash 
        }
        
    end

    def where(column_name, criteria)
        match_array = [] 
        result = {}
        @hash_array.each{ |e_hash| 
            if(e_hash[column_name]==criteria) 
                result = e_hash 
            end
        }

        result.each{|k, val| match_array << val }



        return [match_array.join(',')]
    end
end
