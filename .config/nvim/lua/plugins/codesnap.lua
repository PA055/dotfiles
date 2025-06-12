return {
    "mistricky/codesnap.nvim",
    build = "make",
    opts = {
        bg_padding = 5,
        watermark = "",
        save_path = (os.getenv("XDG_PICTURES_DIR") or (os.getenv("HOME").. "/Pictures")) .. "/Screenshots",
        has_breadcrumbs = true,
        has_line_number = false,
        bg_theme = "bamboo",
    },
    keys = {
        { "<leader>cs", "<cmd>CodeSnap<CR>", mode = "x", desc = "Screenshot and copy selected code." }
    }
}
