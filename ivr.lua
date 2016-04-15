local redis = require "resty.redis"
local cjson = require "cjson"
local cache = redis.new()
cache.connect(cache, '127.0.0.1', '22122')

local args = nil
local err  = nil
local uri = ngx.var.request_uri

local callid = nil
local channel = 0

if  string.find(uri, 'dianxin') then
    args = ngx.req.get_uri_args()
    callid = args["vSessionsId"]
    if callid == nil then
        callid = args["vSessionId"]
    end
    channel = 1
elseif  string.find(uri, 'yunhu') then
    ngx.req.read_body()
    local body_data = ngx.req.get_body_data()
    local data = cjson.decode(body_data)
    callid = data['call_id']
    channel = 2
elseif  string.find(uri, 'yuntongxun') then
    ngx.req.read_body()
    local args, err = ngx.req.get_post_args()
    for key, val in pairs(args) do
        if key == 'callid' then
            callid = val
        end
    end
    if callid == nil then 
        args_get = ngx.req.get_uri_args()
        callid = args_get['callid']
    end
    if callid == nil then 
        args_get = ngx.req.get_uri_args()
        callid = args_get['mcallid']
    end
    channel = 3
    if callid == nil then
        local xml = require("xmlSimple").newParser()
        local xml_str = ngx.req.get_body_data()
        local parsed_xml = xml:ParseXmlText(xml_str)
        callid = parsed_xml.request.callSid:value()
    end
else

end


if callid == nil then
    ngx.say(uri)
    ngx.say(cjson.encode(args))
    ngx.say('callid is empty')
    return ''
end


local key = callid .. '_channel' .. channel
local res = cache:get(key)
if res ==ngx.null then
    ngx.say("cache get foo error")
    return ''
end

ngx.var.backend = res
