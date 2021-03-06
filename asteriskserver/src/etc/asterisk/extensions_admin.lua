util = require("util")

local extensions = {
    admin_main = util.context(
        {intro_statements={"fewtel"},
         menu_entries={
             [1]={"for-the-fewtel-voice-conference", "futel-conf"},
             [2]={{"for", "the", "outgoing", "menus"}, "outgoing-chooser"},
             [3]={"for-an-internal-dialtone", "internal-dialtone-wrapper"},
             [4]={"to-record-a-menu", "record"},
             [0]={"for-the-operator", "operator"}},
         statement_dir=""}),
    member_main = util.context(
        {intro_statements={"fewtel"},
         menu_entries={
             [1]={"for-the-fewtel-voice-conference", "futel-conf"},
             [2]={"for-an-internal-dialtone", "internal-dialtone-wrapper"},
             [3]={"to-record-a-menu", "record"},
             [4]={"for-the-wildcard-line", "wildcard_line_outgoing"},
             [0]={"for-the-operator", "operator"}},
         statement_dir=""})}

return extensions
