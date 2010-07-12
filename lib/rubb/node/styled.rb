module RuBB
  class Node
    class Styled < Node
      attr_accessor :style_hash
      
      def initialize(options={})
        super(options)
        @style_hash = options[:style_hash] || {}
      end
      
      def to_html
        html = '<span style="'
        @style_hash.each do |k,v|
          if(v) # if v is not nil
            v = v[/\A([^;]*);/,1] if v.include?(';') # ignore semicolons and any trailing text
            html += "#{k}: #{v};"
          end
        end
        html += '">'
        @children.each do |child|
          html += child ? child.to_html : ''
        end
        html + "</span>"
      end
    end
  end
end

