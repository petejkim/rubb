module RuBB
  class Node
    class Quote < Node
      attr_accessor :who
      
      def initialize(options={})
        super(options)
        @who = options[:who] || ''
      end
      
      def to_html
        html = '<p class="rubb_quote_header">Quote:</p><blockquote>'
        html += "<p class=\"rubb_quote_who\">Originally Posted by <strong>#{Parser.escape_quotes(@who)}</strong></p>" unless(@who.empty?)
        html += '<p class="rubb_quote_content">'
        @children.each do |child|
          html += child ? child.to_html : ''
        end
        html + '</p></blockquote>'
      end
    end
  end
end
