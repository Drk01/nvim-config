local R = require "pears.rule"

require"pears".setup(function(conf)
    conf.expand_on_enter(true)
    conf.on_enter(function(pears_handle)
        if vim.fn.pumvisible() == 1 and vim.fn.complete_info().selected ~= -1 then
            return vim.fn["compe#confirm"]("<CR>")
        else
            pears_handle()
        end
    end)

    conf.pair("'", {
        close = "'",
        should_expand = R.all_of(R.not_(R.start_of_context "[a-zA-Z]"),
                                 R.child_of_node "string")
    })
end)
