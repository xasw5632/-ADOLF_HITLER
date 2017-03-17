
do 

local function Ch_Dev(msg) 
    --Checking mute 
    local Memo = 'mate:'..msg.to.id 
    if redis:get(Memo) and msg.fwd_from and not is_sudo(msg) and not is_owner(msg) and not is_momod(msg) and not is_admin1(msg)  then 
            delete_msg(msg.id, ok_cb, true) 
            send_large_msg(get_receiver(msg), '#تہۧحہۧذيہۧر 🐸🍷 /nلہۧتہۧعہۧيہۧد آلہۧتہۧوجہۧيہۧه يہۧآ  🐴 /n فہۧيے🔃آلہۧمہۧجہۧمہۧوعہۧةة 🤖👥\n👾 #آلہۧمہطہۧيے : @'..msg.from.username) 
            return "done" 
        end 
        return msg 
    end 

local function ii02ii(msg, matches) 
    chat_id =  msg.to.id 
    if is_momod(msg) and matches[1] == 'قفل' then 
                    local Mushakil = 'mate:'..msg.to.id 
                    redis:set(Mushakil, true) 
                    return "" 
  elseif is_momod(msg) and matches[1] == 'فتح' then 
                    local ch_dev = 'mate:'..msg.to.id 
                    redis:del(ch_dev) 
                    return "" 
end 

end 

return { 
    patterns = { 
        '^(قفل) التوجيه$', 
        '^(فتح) التوجيه$' 
    }, 
    run = ii02ii, 
    pre_process = Ch_Dev 
} 
end 
