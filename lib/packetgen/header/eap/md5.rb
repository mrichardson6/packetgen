# This file is part of PacketGen
# See https://github.com/sdaubert/packetgen for more informations
# Copyright (C) 2016 Sylvain Daubert <sylvain.daubert@laposte.net>
# This program is published under MIT license.

module PacketGen
  module Header
    class EAP

      # Extensible Authentication Protocol (EAP) - 
      # {https://tools.ietf.org/html/rfc3748#section-5.4 MD5 challenge}
      # @author Sylvain Daubert
      class MD5 < Base
        # @!attribute value_size
        #  @return [Integer] 8-bit value size
        define_field :value_size, Types::Int8
        # @!attribute value
        #  @return [::String]
        define_field :value, Types::String,
                     builder: ->(h) { Types::String.new('', length_from: h[:value_size]) }
        # @!attribute optional_name
        #  @return [::String]
        define_field :optional_name, Types::String
      end

      EAP.bind_header MD5, type: EAP::TYPES['MD5-Challenge']
    end
  end
end
