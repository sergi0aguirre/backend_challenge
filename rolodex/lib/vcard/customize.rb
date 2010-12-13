module Vpim
  class Vcard
    class Maker
      def add_company(value)
        @card << Vpim::DirectoryInfo::Field.create( 'COMPANY:', value.to_str );
      end
      def add_picture(value)
        @card << Vpim::DirectoryInfo::Field.create( 'PICTURE URL:', value.to_str );
      end
    end
  end
end