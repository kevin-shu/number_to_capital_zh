require "number_to_zh_tw/version"

module NumberToZhTw
  # Formats a +number+ into a chinese amount in words(e.g., 壹万圓整).
  #
  # === Examples
  # number_to_capital_zh(10001.00)                   # => '壹万圓整',
  # number_to_capital_zh(100000.10)              # => '壹拾万圓壹角整',
  # number_to_capital_zh(0.1)                    # => '壹角整',
  # number_to_capital_zh(1.11)                   # => '壹圓壹角壹分',
  # number_to_capital_zh(1.01)                   # => '壹圓零壹分',
  # number_to_capital_zh(0.01)                   # => '壹分',
  # number_to_capital_zh(1)                      # => '壹圓整',
  # number_to_capital_zh(10)                     # => '壹拾圓整',
  # number_to_capital_zh(100010.10)              # => '壹拾万零壹拾圓壹角整',
  # number_to_capital_zh(100000000)              # => '壹亿圓整',
  # number_to_capital_zh(1029.59)                # => '壹仟零贰拾玖圓伍角玖分',
  # number_to_capital_zh(1029.58)                # => '壹仟零贰拾玖圓伍角捌分',
  # number_to_capital_zh(1029.6)                 # => '壹仟零贰拾玖圓陆角整',
  # number_to_capital_zh(1029)                   # => '壹仟零贰拾玖圓整',
  #
  # number_to_capital_zh(0)                      # => '零',
  # number_to_capital_zh(0.0)                    # => '零',
  # number_to_capital_zh(0.00)                   # => '零',
  # number_to_capital_zh(-0)                     # => '零',
  # number_to_capital_zh(-0.0)                   # => '零',
  # number_to_capital_zh(-0.00)                  # => '零',
  #
  # number_to_capital_zh(-360.0)                 # => '负叁佰陆拾圓整',
  # number_to_capital_zh(-10000.00)              # => '负壹万圓整',
  # number_to_capital_zh(-100000.10)             # => '负壹拾万圓壹角整',
  # number_to_capital_zh(-0.1)                   # => '负壹角整',
  # number_to_capital_zh(-1.11)                  # => '负壹圓壹角壹分',
  # number_to_capital_zh(-1.01)                  # => '负壹圓零壹分',
  # number_to_capital_zh(-0.01)                  # => '负壹分',
  # number_to_capital_zh(-1)                     # => '负壹圓整',
  # number_to_capital_zh(-10)                    # => '负壹拾圓整',
  # number_to_capital_zh(-100010.10)             # => '负壹拾万零壹拾圓壹角整',
  # number_to_capital_zh(-100000000)             # => '负壹亿圓整',
  # number_to_capital_zh(-1029.015)              # => '负壹仟零贰拾玖圓零贰分',
  # number_to_capital_zh(-1029.59)               # => '负壹仟零贰拾玖圓伍角玖分',
  # number_to_capital_zh(-1029.58)               # => '负壹仟零贰拾玖圓伍角捌分',
  # number_to_capital_zh(-1029.6)                # => '负壹仟零贰拾玖圓陆角整',
  # number_to_capital_zh(-1029)                  # => '负壹仟零贰拾玖圓整',
  # number_to_capital_zh(-1029.015)              # => '负壹仟零贰拾玖圓零贰分',
  def number_to_capital_zh_tw(n)
    cNum = ["零","壹","貳","叁","肆","伍","陸","柒","捌","玖","-","-","萬","仟","佰","拾","億","仟","佰","拾","萬","仟","佰","拾","圓","角","分"]
    cCha = [['零圓','零拾','零佰','零仟','零萬','零億','億萬','零零零','零零','零萬','零億','億萬','零圓'], [ '圓','零','零','零','萬','億','億','零','零','萬','億','億','圓']]

    i = 0
    sNum = ""
    sTemp = ""
    result = ""
    tmp = ("%.0f" % (n.abs.to_f * 100)).to_i
    return '零' if tmp == 0
    raise '整數部分加二位小數長度不能大於15' if tmp.to_s.size > 15
    sNum = tmp.to_s.rjust(15, ' ')

    for i in 0..14
      stemp = sNum.slice(i, 1)
      if stemp == ' '
        next
      else
        result += cNum[stemp.to_i] + cNum[i + 12];
      end
    end

    for m in 0..12
      result.gsub!(cCha[0][m], cCha[1][m])
    end

    if result.index('零分').nil? # 没有分时, 零角改成零
      result.gsub!('零角','零')
    else
      if result.index('零角').nil? # 有没有分有角时, 后面加"整"
        result += '整'
      else
        result.gsub!('零角', '整')
      end
    end

    result.gsub!('零分', '')
    "#{n < 0 ? "負" : ""}#{result}"
  end
end

ActionView::Base.send :include, NumberToZhTw

