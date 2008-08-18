module DataMapper
  module Types
    class DateTimeNoTZ < DataMapper::Type
      primitive DateTime
      lazy false
      
      def self.load(value, property)
        # puts "DateTimeNoTZ.load value #{value.to_s} property #{property.inspect}"
        if value.nil?
          return nil
        else
          converted_value = DateTime.parse(value.strftime("%FT%T") + "+00:00")
          # puts "DateTimeNoTZ.load converted_value #{converted_value.to_s}"
          return converted_value
        end
      end

      def self.dump(value, property)
        return nil if value.nil?
        # puts "DateTimeNoTZ.dump value #{value.to_s} property #{property.inspect}"
        
        tz_offset =  DateTime.now.offset
        converted_value = DateTime.parse(value.new_offset(-tz_offset).strftime("%FT%T") + "+00:00")
        # puts "DateTimeNoTZ.dump value #{value.to_s} converted_value #{converted_value.to_s} property #{property.inspect}"
        return converted_value
      end

      def self.typecast(value, property)
        # puts "DateTimeNoTZ.typecast value #{value.inspect} poperty #{property.inspect}"
        value.kind_of?(DateTimeNoTZ) ? value : load(value, property)
      end
      
    end # class URI
  end # module Types
end # module DataMapper
