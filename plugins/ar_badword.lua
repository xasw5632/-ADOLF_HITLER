local function addword(msg, name)
    local Ch_Dev = 'chat:'..msg.to.id..':badword'
    redis:hset(Ch_Dev, name, 'newword')
    return "تہۧم ✅ آضہۧآفہۧة كہۧلہۧمہۧة جہۧديہۧدة📝  فہۧيے قہۧآئہۧمہۧةة آلہۧمہۧنہۧع  ❌🚷\n>"..name
end

local function get_variables_hash(msg)

    return 'chat:'..msg.to.id..':badword'

end 

local function list_variablesbad(msg)
  local Ch_Dev = get_variables_hash(msg)

  if Ch_Dev then
    local names = redis:hkeys(Ch_Dev)
    local text = 'قہۧآئہۧمہۧةة آلہۧكہۧلہۧمہۧآت 📝 الہۧمہۧمنہۧوع كہۧتبہۧهہۧآ هہۧنہۧآ ↩️🤖 :\n\n'
    for i=1, #names do
      text = text..'> '..names[i]..'\n'
    end
    return text
	else
	return 
  end
end

function clear_commandbad(msg, var_name)
  --Save on redis  
  local hash = get_variables_hash(msg)
  redis:del(hash, var_name)
  return 'تہۧم ☑️ مہۧسہۧح قہۧآئہۧمہۧةة آلہۧمہۧنہۧع 🤖⁉️'
end

local function list_variables2(msg, value)
  local hash = get_variables_hash(msg)
  
  if hash then
    local names = redis:hkeys(hash)
    local text = ''
    for i=1, #names do
	if string.match(value, names[i]) and not is_momod(msg) then
	if msg.to.type == 'channel' then
	delete_msg(msg.id,ok_cb,false)
	else
	kick_user(msg.from.id, msg.to.id)

	end
return 
end
      --text = text..names[i]..'\n'
    end
  end
end
local function get_valuebad(msg, var_name)
  local hash = get_variables_hash(msg)
  if hash then
    local value = redis:hget(hash, var_name)
    if not value then
      return
    else
      return value
    end
  end
end
function clear_commandsbad(msg, cmd_name)
  --Save on redis  
  local hash = get_variables_hash(msg)
  redis:hdel(hash, cmd_name)
  return ''..cmd_name..'  تہۧم ✅ آلہۧغہۧاء هہۧذه آلہۧكہۧلہۧمہۧةة 📝 مہۧن  قہۧآئہۧمہۧةة آلہۧمہۧنہۧع  🤖🍷'
end

local function Memo(msg, matches)
  if matches[2] == 'منع' then
  if not is_momod(msg) then
   return 'only for moderators'
  end
  local name = string.sub(matches[3], 1, 50)

  local text = addword(msg, name)
  return text
  end
  if matches[2] == 'قائمة المنع' then
  return list_variablesbad(msg)
  elseif matches[2] == 'مسح قائمة المنع' then
if not is_momod(msg) then return '_|_' end
  local asd = '1'
    return clear_commandbad(msg, asd)
  elseif matches[2] == 'الغاء منع' or matches[2] == 'rw' then
   if not is_momod(msg) then return 'ديہۧ 🌞✨' end
    return clear_commandsbad(msg, matches[3])
  else
    local name = user_print_name(msg.from)
  
    return list_variables2(msg, matches[1])
  end
end

return {
  patterns = {
  "^()(rw) (.*)$",
  "^()(منع) (.*)$",
   "^()(الغاء منع) (.*)$",
    "^()(قائمة المنع)$",
    "^()(مسح قائمة المنع)$",
"^(.+)$",
	   
  },
  run = Memo
}
