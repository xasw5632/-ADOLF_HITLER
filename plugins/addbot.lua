--[[ 
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀          
▀▄ ▄▀                                      ▀▄ ▄▀ 
▀▄ ▄▀    BY Memo                           ▀▄ ▄▀ 
▀▄ ▄▀     BY Memo       (@ii02iI)          ▀▄ ▄▀ 
▀▄ ▄▀ Making the file by Memo              ▀▄ ▄▀   
▀▄ ▄▀         Add bots  : اضافه البوت         ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀
--]]
do 

  local function parsed_url(link) 
    local parsed_link = URL.parse(link) 
    local parsed_path = URL.parse_path(parsed_link.path) 
    i = 0 
    for k,segment in pairs(parsed_path) do 
      i = i + 1 
      if segment == 'joinchat' then 
        Ch_Dev = string.gsub(parsed_path[i+1], '[ %c].+$', '') 
        break 
      end 
    end 
    return Ch_Dev
  end 

  local function Memo(extra, success, result) 
    local Ch_dev = parsed_url(result.text) 
    join = import_chat_link(Ch_dev, ok_cb, false) 
  end 

  function Memo(msg, Ch_Dev) 
    if is_sudo(msg) then 
      if msg.reply_id then 
        msgr = get_message(msg.reply_id, Memo, {msg=msg}) 
      elseif Ch_Dev[1] then 
        local Mushakil = parsed_url(Ch_Dev[1]) 
        join = import_chat_link(Mushakil, ok_cb, false) 
      end 
    end 
  end 

  return { 
    description = 'دخول البوت الى الكروب عن طريق الرابط .', 
    usage = { 
      'فوت : دخول البوت الى المجموعة عن طريق ارسال رابط في المجموعة وبالرد عليه وكتابه (فوت) فقط ', 
      '!فوت [دعوة عن طريق الرابط] : تم تعريب الملف 100% من قبل #ميمو_مشآكل_العراقي [add_from_link] .' 
      },                                                                                                                                                                      -- بوت التواصل للمحضورين 
    patterns = {                                                                       
      '^[Aa][dD][dD][bB][oO][tT]$',                                                    
      '^[Aa][Dd][Dd][bB][Oo][Tt] (.*)$',                                               
      '^فوت$',
      '^فوت (.*)$'
    }, 
    run = Memo, 
  } 

end 
 --[[ تم تعريب الملف بواسطة المطور #ميمو_مشآكل_العراقي
 @ii02ii
 بوت التواصل للمحضورين 
 @ii02ii_bot
 قناة المطورين 
 @Ch_Dev ]]--
