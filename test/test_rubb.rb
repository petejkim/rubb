$: << (File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
require 'test_helper'

class RuBBTest < Test::Unit::TestCase
  def setup
  end

  def test_escape
    bb   = "<p>tom & jerry kids</p>"
    html = "&lt;p&gt;tom &amp; jerry kids&lt;/p&gt;"
    assert_equal html, bb.bb_to_html
  end
  
  def test_text
    bb   = "hello\nbye"
    html = "hello<br />bye"
    assert_equal html, bb.bb_to_html
  end
  
  def test_h1
    bb   = '[h1]hello[/h1]'
    html = '<h1>hello</h1>'
    assert_equal html, bb.bb_to_html
  end

  def test_h2
    bb   = '[h2]hello[/h2]'
    html = '<h2>hello</h2>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_h3
    bb   = '[h3]hello[/h3]'
    html = '<h3>hello</h3>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_h4
    bb   = '[h4]hello[/h4]'
    html = '<h4>hello</h4>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_h5
    bb   = '[h5]hello[/h5]'
    html = '<h5>hello</h5>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_h6
    bb   = '[h6]hello[/h6]'
    html = '<h6>hello</h6>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_b
    bb   = '[b]hello[/b]'
    html = '<strong>hello</strong>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_i
    bb   = '[i]hello[/i]'
    html = '<em>hello</em>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_u
    bb   = '[u]hello[/u]'
    html = '<ins>hello</ins>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_s
    bb   = '[s]hello[/s]'
    html = '<del>hello</del>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_code
    bb   = '[code]<p>hi</p>[b]hi[/b][/code]'
    html = '<pre>&lt;p&gt;hi&lt;/p&gt;[b]hi[/b]</pre>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_left
    bb   = '[left]hello[/left]'
    html = '<div style="text-align: left;">hello</div>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_center
    bb   = '[center]hello[/center]'
    html = '<div style="text-align: center;">hello</div>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_right
    bb   = '[right]hello[/right]'
    html = '<div style="text-align: right;">hello</div>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_quote
    bb   = '[quote]hello world![/quote]'
    html = '<blockquote><p>hello world!</p></blockquote>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_named_quote
    bb   = '[quote=raingrove]hello world![/quote]'
    html = '<blockquote><dl><dt>raingrove</dt><dd><p>hello world!</p></dd></dl></blockquote>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_size
    bb   = '[size=16]hello[/size]'
    html = '<span style="font-size: 16.0px;">hello</span>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_semicolon
    bb   = '[size=16;display: none;]hello[/size]'
    html = '<span style="font-size: 16.0px;">hello</span>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_color
    bb   = '[color=#ff0000]hello[/color]'
    html = '<span style="color: #ff0000;">hello</span>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_url_simple
    bb   = '[url]http://test.com/[/url]'
    html = '<a href="http://test.com/">http://test.com/</a>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_url_named
    bb   = '[url=http://test.com/]Test[/url]'
    html = '<a href="http://test.com/">Test</a>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_url_named_with_single_quotes
    bb   = "[url=\'http://test.com/\']Test[/url]"
    html = '<a href="http://test.com/">Test</a>'
    assert_equal html, bb.bb_to_html
  end

  def test_url_named_with_double_quotes
    bb   = '[url="http://test.com/"]Test[/url]'
    html = '<a href="http://test.com/">Test</a>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_email_simple
    bb   = '[email]test@test.com[/email]'
    html = '<a href="mailto:test@test.com">test@test.com</a>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_email_named
    bb   = '[email=test@test.com]Test[/email]'
    html = '<a href="mailto:test@test.com">Test</a>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_escape_quotes
    bb   = "[url=hello\">hello<p class='test'>hi</p><a href=\"]hello[/url]"
    html = "<a href=\"hello\\\"&gt;hello&lt;p class=\\\'test\\\'&gt;hi&lt;/p&gt;&lt;a href=\\\"\">hello</a>"
    assert_equal html, bb.bb_to_html
  end
  
  def test_img_simple
    bb   = '[img]http://test.com/hello.jpg[/img]'
    html = '<img src="http://test.com/hello.jpg" alt="" />'
    assert_equal html, bb.bb_to_html
  end
  
  def test_img_with_dimensions
    bb   = '[img=100x200]http://test.com/hello.jpg[/img]'
    html = '<img src="http://test.com/hello.jpg" style="width: 100px; height: 200px;" alt="" />'
    assert_equal html, bb.bb_to_html
  end
  
  def test_img_with_dimensions_with_quotes
    bb   = '[img="100x200"]http://test.com/hello.jpg[/img]'
    html = '<img src="http://test.com/hello.jpg" style="width: 100px; height: 200px;" alt="" />'
    assert_equal html, bb.bb_to_html
  end
  
  def test_img_with_invalid_dimensions
    bb   = '[img="100"]http://test.com/hello.jpg[/img]'
    html = '<img src="http://test.com/hello.jpg" alt="" />'
    assert_equal html, bb.bb_to_html
  end
  
  def test_ul
    bb   = '[ul][li]item1[/li][li]item2[/li][/ul]'
    html = '<ul><li>item1</li><li>item2</li></ul>'
    assert_equal html, bb.bb_to_html
  end

  def test_ol
    bb   = '[ol][li]item1[/li][li]item2[/li][/ol]'
    html = '<ol><li>item1</li><li>item2</li></ol>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_list_with_extraneous_stuff
    bb   = '[ul]blah[li]item1[/li][li]item2[/li]blah[b]blah[/b]blah[/ul]'
    html = '<ul><li>item1</li><li>item2</li></ul>'
    assert_equal html, bb.bb_to_html
  end

  def test_table
    bb   = '[table][tr][th]col1[/th][th]col2[/th][/tr][tr][td]data1[/td][td]data2[/td][/tr][/table]'
    html = '<table><tr><th>col1</th><th>col2</th></tr><tr><td>data1</td><td>data2</td></tr></table>'
    assert_equal html, bb.bb_to_html
  end

  def test_table_with_extraneous_stuff
    bb   = '[table]blah[tr]blah[th]col1[/th]blah[th]col2[/th]blah[/tr]blah[tr]blah[td]data1[/td]blah[td]data2[/td]blah[/tr]blah[/table]'
    html = '<table><tr><th>col1</th><th>col2</th></tr><tr><td>data1</td><td>data2</td></tr></table>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_str_around
    bb   = 'aaa[b]bbb[/b]ccc'
    html = 'aaa<strong>bbb</strong>ccc'
    assert_equal html, bb.bb_to_html
  end
  
  def test_nested
    bb   = '[b]aaa[b]bbb[/b]ccc[/b]'
    html = '<strong>aaa<strong>bbb</strong>ccc</strong>'
    assert_equal html, bb.bb_to_html
  end
  
  def test_complex
    bb   = "xx[s]aaa[b]bbb[u]eee[/u]ff\nff[/b]ccc[i]ggg[/i]hhh[/s]yy"
    html = 'xx<del>aaa<strong>bbb<ins>eee</ins>ff<br />ff</strong>ccc<em>ggg</em>hhh</del>yy'
    assert_equal html, bb.bb_to_html
  end
end