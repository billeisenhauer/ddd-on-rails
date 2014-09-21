module Model

  module Location

    class Location

      def initialize(un_locode, name)
        self.un_locode = un_locode
        self.name = name
      end

      attr_reader :un_locode, :name

      def same_identity_as?(other)
        un_locode.same_value_as?(other.un_locode)
      end
      
      def ==(other)
        other.is_a?(Location) && same_identity_as?(other)
      end
      alias_method :eql?, :==

      private

        def un_locode=(un_locode)
          raise_null_un_locode_error unless un_locode
          @un_locode = un_locode
        end

        def name=(name)
          raise_null_name_error unless name
          @name = name
        end

        def raise_null_un_locode_error
          raise ArgumentError.new('UN/Locode cannot be null')
        end

        def raise_null_name_error
          raise ArgumentError.new('Name cannot be null')
        end

    end

    class Location
      UNKNOWN = new(UNLocode.new('XXXXX'), 'Unknown Location')
    end

  end

end




# private UnLocode unLocode;
# private String name;
#
# /**
#  * Special Location object that marks an unknown location.
#  */
# public static final Location UNKNOWN = new Location(
#   new UnLocode("XXXXX"), "Unknown location"
# );