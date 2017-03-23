local function Ch_Dev(extra, suc, result)
  for i=1, #result do
    delete_msg(result[i].id, ok_cb, false)
  end
  if tonumber(extra.con) == #result then
    send_msg(extra.chatid, '('..#result..')  رسہۧآلہۧة داخہۧل آلہۧكہۧروبہۧ 🐸🍷 تہۧم  مہۧسہۧحہۧهہۧآ وتہۧعہبہۧتونہۧيے 🌝😹', ok_cb, false)
  else
    send_msg(extra.chatid, 'تہۧم 🐸🍷 مہۧسہۧح الہۧحہۧد آلہۧنہۧهہۧآئہۧيے  آلہۧيے مہۧن آلہۧرسہۧآئہۧل 🌝😹', ok_cb, false)
  end
end
local function Memo(msg, matches)
  if matches[1] == 'مسح' and is_momod(msg) then
    if msg.to.type == 'channel' then
      if tonumber(matches[2]) > 1000 or tonumber(matches[2]) < 1 then
        return " عہۧدد آلہۧرسہۧآئہۧل الہۧتہۧيے بہۧآمہۧكہۧآنہۧيے  مہۧسہۧحہۧهہۧآ مہۧن 100-1    🌝🍷"
      end
      get_history(msg.to.peer_id, matches[2] + 1 , Ch_Dev , {chatid = msg.to.peer_id, con = matches[2]})
    else
      return "4 مطورين فقط ؟"
    end
  else
    return 
  end
end

return {
    patterns = {
        '^(مسح) (%d*)$',
    },
    run = Memo
}
