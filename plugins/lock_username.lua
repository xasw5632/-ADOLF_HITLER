
local function Ch_Dev(msg, matches) 
    if is_momod(msg) then 
        return 
    end 
    if not is_momod(msg) and matches[1] == '#' then 
    local data = load_data(_config.moderation.data) 
    if data[tostring(msg.to.id)] then 
        if data[tostring(msg.to.id)]['settings'] then 
            if data[tostring(msg.to.id)]['settings']['username'] then 
                username = data[tostring(msg.to.id)]['settings']['username'] 
            end 
        end 
    end 
    local chat = get_receiver(msg) 
    local user = "user#id"..msg.from.id 
    if username == "yes" then 
       delete_msg(msg.id, ok_cb, true) 
    end 
end 
return { 
  patterns = { 
  "@" 
  }, 
  run = Ch_Dev 
} 
end
