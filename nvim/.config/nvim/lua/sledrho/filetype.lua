-- Config for filetype detection

vim.g.do_filetype_lua = 1


vim.filetype.add({
    filename = {
        [".drone.star"] = "starlark",
        [".star"] = "starlark"
    },
})
