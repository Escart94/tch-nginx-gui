--pretranslated: do not change this file
 ngx.print('<ul class="nav nav-tabs">\
\
');  

gettext.textdomain('webui-core')
local content_helper = require("web.content_helper")
local ipairs, string = ipairs, string
local items = {
    {"iproutes-modal.lp", T"Ip Extras"},
    {"mwan-modal.lp", T"Routing Policy"},
	{"bridge-grouping-modal.lp", T"Bridge Grouping"},
	{"fast-cache-option-modal.lp", T"Fast Cache Option"},
}


local tabs = {}
local session = ngx.ctx.session
    for _,v in pairs(items) do
        if session:hasAccess("/modals/" .. v[1]) then
            tabs[#tabs+1] = v
        end
    end

local html = {}

local uri = ngx.var.uri
if ngx.var.args and string.len(ngx.var.args) > 0 then
    uri = uri .. "?" .. ngx.var.args
end

for _,v in ipairs(tabs) do
    local active = ""
    if uri == ("/modals/" .. v[1]) then
        active = "active"
    end

    html[#html+1] = string.format('<li class="%s"><a id ="%s" href="#" class="open-modal" data-remote="/modals/%s">%s</a></li>', active, v[2], v[1], v[2])
end
ngx.print(html)

  ngx.print('\
\
</ul>\
'); 