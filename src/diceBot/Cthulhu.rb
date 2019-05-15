# -*- coding: utf-8 -*-

class Cthulhu < DiceBot
  setPrefixes(['CC(B)?\(\d+\)', 'CC(B)?.*','RES(B)?.*', 'CBR(B)?\(\d+,\d+\)', 'zzz', 'xxx', 'ccc'])

  def initialize
    #$isDebug = true
    super
    @special_percentage  = 20
    @critical_percentage = 1
    @fumble_percentage   = 1
  end

  def gameName
    'クトゥルフ'
  end

  def gameType
    "Cthulhu"
  end

  def getHelpMessage
    return <<INFO_MESSAGE_TEXT
c=クリティカル値 ／ f=ファンブル値 ／ s=スペシャル

1d100<=n    c・f・sすべてオフ（単純な数値比較判定のみ行います）

・cfs判定付き判定コマンド

CC	 1d100ロールを行う c=1、f=100
CCB  同上、c=5、f=96

例：CC<=80  （技能値80で行為判定。1%ルールでcf適用）
例：CCB<=55 （技能値55で行為判定。5%ルールでcf適用）

・組み合わせロールについて

CBR(x,y)	c=1、f=100
CBRB(x,y)	c=5、f=96

・抵抗表ロールについて
RES(x-y)	c=1、f=100
RESB(x-y)	c=5、f=96

※故障ナンバー判定

・CC(x) c=1、f=100
x=故障ナンバー。出目x以上が出た上で、ファンブルが同時に発生した場合、共に出力する（テキスト「ファンブル＆故障」）
ファンブルでない場合、成功・失敗に関わらずテキスト「故障」のみを出力する（成功・失敗を出力せず、上書きしたものを出力する形）

・CCB(x) c=5、f=96
同上

INFO_MESSAGE_TEXT
  end

  def rollDiceCommand(command)
    case command
    when /CCB/i
      # 5%
      @critical_percentage = 5
      @fumble_percentage   = 5
      return getCheckResult(command)
    when /CC/i
      # 1%
      @critical_percentage = 1
      @fumble_percentage   = 1
      return getCheckResult(command)
    when /RESB/i
      # 5%
      @critical_percentage = 5
      @fumble_percentage   = 5
      return getRegistResult(command)
    when /CBRB/i
      # 5%
      @critical_percentage = 5
      @fumble_percentage   = 5
      return getCombineRoll(command)
    when /RES/i
      # 1%
      @critical_percentage = 1
      @fumble_percentage   = 1
      return getRegistResult(command)
    when /CBR/i
      # 1%
      @critical_percentage = 1
      @fumble_percentage   = 1
      return getCombineRoll(command)
    when /zzz/i
      zzzArray = rand(23) + 1
		case zzzArray
		when 1
			puts '1:気絶（時間経過または医療/応急手当で復帰）'
		when 2
			puts '2:金縛り（自分の意志で動けない）'
		when 3
			puts '3:狂気的幻覚（追加SAN1d3）'
		when 4
			puts '4:反射的逃走'
		when 5
			puts '5:生命の危機に寄る突発的発情（子孫を残す強迫観念）'
		when 6
			puts '6:逃避からくる自傷行為（ダメージ1d3）'
		when 7
			puts '7:異様なものを愛おしく感じる'
		when 8
			puts '8:一時的な言語失調（喋る技能使用不可）'
		when 9
			puts '9:万能感（危険を顧みない）'
		when 10
			puts '10:身体の不調（目眩・頭痛・嘔吐など。全ての技能-5％）'
		when 11
			puts '11:心因性の聴覚不全（聴くことが必要な技能使用不可）'
		when 12
			puts '12:心因性の盲目（見ることが必要な技能使用不可）'
		when 13
			puts '13:パラノイア（他人を信用できなくなる。精神分析される時-10％）'
		when 14
			puts '14:偏食症（異常な食欲、または食べれないものを食べたがる）'
		when 15
			puts '15:失笑恐怖症（笑いが止まらなくなる。全ての技能-5％）'
		when 16
			puts '16:人物フェティッシュ（誰かに異常執着する。執着対象を失うとSAN減少1d8）'
		when 17
			puts '17:記憶喪失（1d20時間の出来事を忘れる）'
		when 18
			puts '18:殺傷衝動（恐怖の対象への殺意、または殺すことが救いだと思い込む）'
		when 19
			puts '19:感情の消失（人間的感情を失う。説得系技能時-10％）'
		when 20
			puts '20:物品フェティッシュ（何かに異常執着する。執着対象を失うとSAN減少1d3）'
		when 21
			puts '21:交流不全（会話を聞いても意味が理解できない。文章なら可）'
		when 22
			puts '22:心因的な文語障害（文章を読んでも意味が理解できない。会話なら可）'
		when 23
			puts '23:自由枠（お好きな狂気をKPと相談の上お選びください）'     
    when /xxx/i
      zzzArray = rand(23) + 1
		case zzzArray
		when 1
			puts '1:気絶（時間経過または医療/応急手当で復帰）'
		when 2
			puts '2:金縛り（自分の意志で動けない）'
		when 3
			puts '3:狂気的幻覚（追加SAN1d3）'
		when 4
			puts '4:反射的逃走'
		when 5
			puts '5:生命の危機に寄る突発的発情（子孫を残す強迫観念）'
		when 6
			puts '6:逃避からくる自傷行為（ダメージ1d3）'
		when 7
			puts '7:異様なものを愛おしく感じる'
		when 8
			puts '8:一時的な言語失調（喋る技能使用不可）'
		when 9
			puts '9:万能感（危険を顧みない）'
		when 10
			puts '10:身体の不調（目眩・頭痛・嘔吐など。全ての技能-5％）'
		when 11
			puts '11:心因性の聴覚不全（聴くことが必要な技能使用不可）'
		when 12
			puts '12:心因性の盲目（見ることが必要な技能使用不可）'
		when 13
			puts '13:パラノイア（他人を信用できなくなる。精神分析される時-10％）'
		when 14
			puts '14:偏食症（異常な食欲、または食べれないものを食べたがる）'
		when 15
			puts '15:失笑恐怖症（笑いが止まらなくなる。全ての技能-5％）'
		when 16
			puts '16:人物フェティッシュ（誰かに異常執着する。執着対象を失うとSAN減少1d8）'
		when 17
			puts '17:記憶喪失（1d20時間の出来事を忘れる）'
		when 18
			puts '18:殺傷衝動（恐怖の対象への殺意、または殺すことが救いだと思い込む）'
		when 19
			puts '19:感情の消失（人間的感情を失う。説得系技能時-10％）'
		when 20
			puts '20:物品フェティッシュ（何かに異常執着する。執着対象を失うとSAN減少1d3）'
		when 21
			puts '21:交流不全（会話を聞いても意味が理解できない。文章なら可）'
		when 22
			puts '22:心因的な文語障害（文章を読んでも意味が理解できない。会話なら可）'
		when 23
			puts '23:自由枠（お好きな狂気をKPと相談の上お選びください）'  
    when /ccc/i
      zzzArray = rand(23) + 1
		case zzzArray
		when 1
			puts '1:気絶（時間経過または医療/応急手当で復帰）'
		when 2
			puts '2:金縛り（自分の意志で動けない）'
		when 3
			puts '3:狂気的幻覚（追加SAN1d3）'
		when 4
			puts '4:反射的逃走'
		when 5
			puts '5:生命の危機に寄る突発的発情（子孫を残す強迫観念）'
		when 6
			puts '6:逃避からくる自傷行為（ダメージ1d3）'
		when 7
			puts '7:異様なものを愛おしく感じる'
		when 8
			puts '8:一時的な言語失調（喋る技能使用不可）'
		when 9
			puts '9:万能感（危険を顧みない）'
		when 10
			puts '10:身体の不調（目眩・頭痛・嘔吐など。全ての技能-5％）'
		when 11
			puts '11:心因性の聴覚不全（聴くことが必要な技能使用不可）'
		when 12
			puts '12:心因性の盲目（見ることが必要な技能使用不可）'
		when 13
			puts '13:パラノイア（他人を信用できなくなる。精神分析される時-10％）'
		when 14
			puts '14:偏食症（異常な食欲、または食べれないものを食べたがる）'
		when 15
			puts '15:失笑恐怖症（笑いが止まらなくなる。全ての技能-5％）'
		when 16
			puts '16:人物フェティッシュ（誰かに異常執着する。執着対象を失うとSAN減少1d8）'
		when 17
			puts '17:記憶喪失（1d20時間の出来事を忘れる）'
		when 18
			puts '18:殺傷衝動（恐怖の対象への殺意、または殺すことが救いだと思い込む）'
		when 19
			puts '19:感情の消失（人間的感情を失う。説得系技能時-10％）'
		when 20
			puts '20:物品フェティッシュ（何かに異常執着する。執着対象を失うとSAN減少1d3）'
		when 21
			puts '21:交流不全（会話を聞いても意味が理解できない。文章なら可）'
		when 22
			puts '22:心因的な文語障害（文章を読んでも意味が理解できない。会話なら可）'
		when 23
			puts '23:自由枠（お好きな狂気をKPと相談の上お選びください）'  
    end

    return nil
  end

  def getCheckResult(command)

    output = ""
    broken_num = 0
    diff = 0

    if (/CC(B)?(\d+)<=(\d+)/i =~ command)
      # /\(\d+\)/の()はpattern-killerにカイシャクされるらしい
      broken_num = $2.to_i
      diff = $3.to_i
    elsif (/CC(B)?<=(\d+)/i =~ command)
      diff = $2.to_i
    end

    if (diff > 0)
      output += "(1D100<=#{diff})"

      if (broken_num > 0)
        output += " 故障ナンバー[#{broken_num}]"
      end

      total_n, = roll(1, 100)

      output += ' ＞ ' + "#{total_n}"
      output += ' ＞ ' + getCheckResultText(total_n, diff, broken_num)
    else
      # 1D100単純置換扱い
      # 要らないかも
      output += "(1D100)"
      total_n, = roll(1, 100)
      output += ' ＞ ' + "#{total_n}"
    end

    return output
  end

  def getCheckResultText(total_n, diff, broken_num = 0)

    result = ""
    diff_special = 0
    fumble = false

    if( @special_percentage > 0)
      # specialの値設定が無い場合はクリティカル/ファンブル判定もしない
      diff_special = (diff * @special_percentage / 100).floor
      if(diff_special < 1)
        diff_special = 1
      end
    end

    if((total_n <= diff) and (total_n < 100))

      result = "成功"

      if( diff_special > 0)
        if(total_n <= @critical_percentage)
          if(total_n <= diff_special)
            result = "決定的成功/スペシャル"
          else
            result = "決定的成功"
          end
        else
          if(total_n <= diff_special)
            result = "スペシャル"
          end
        end
      end

    else

      result = "失敗"

      if( diff_special > 0)
        if((total_n >= (101 - @fumble_percentage)) and (diff < 100))
          result = "致命的失敗"
          fumble = true
        end
      end

    end

    if(broken_num > 0)
      if(total_n >= broken_num)
        if(fumble)
          result += "/故障"
        else
          result = "故障"
        end
      end
    end

    return result
  end

  def getRegistResult(command)
    output = "1"

    return output unless(/RES(B)?([-\d]+)/i =~ command)

    value = $2.to_i
    target =  value * 5 + 50

    if(target < 5)
      return "(1d100<=#{target}) ＞ 自動失敗"
    end

    if(target > 95)
      return "(1d100<=#{target}) ＞ 自動成功"
    end

    # 通常判定
    total_n, = roll(1, 100)
    result =  getCheckResultText(total_n, target)

    return "(1d100<=#{target}) ＞ #{total_n} ＞ #{result}"
  end

  def getCombineRoll(command)
    output = "1"

    return output unless(/CBR(B)?\((\d+),(\d+)\)/i =~ command)

    diff_1 = $2.to_i
    diff_2 = $3.to_i

    total, = roll(1, 100)

    result_1 = getCheckResultText(total, diff_1)
    result_2 = getCheckResultText(total, diff_2)

    successList = ["決定的成功/スペシャル", "決定的成功", "スペシャル", "成功"]
    failList = ["失敗", "致命的失敗"]

    succesCount = 0
    succesCount += 1 if successList.include?( result_1 )
    succesCount += 1 if successList.include?( result_2 )
    debug("succesCount", succesCount)

    rank =
      if( succesCount >= 2 )
        "成功"
      elsif( succesCount == 1 )
        "部分的成功"
      else
        "失敗"
      end

    return "(1d100<=#{diff_1},#{diff_2}) ＞ #{total}[#{result_1},#{result_2}] ＞ #{rank}"
  end

end
