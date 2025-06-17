return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-lua/plenary.nvim' },
    config = function()
        local dashboard = require('alpha.themes.dashboard')

        local function header()
            local asciiArt = {
                [[      _  __       _   ___     ]],
                [[     / |/ /__ ___| | / (_)_ _ ]],
                [[    /    / -_) _ \ |/ / /  ' \]],
                [[   /_/|_/\__/\___/___/_/_/_/_/]],
                [[                              ]]
            }

            local hour = tostring(os.date("%H"))
            local minute = tostring(os.date("%M"))


            local function currentGreet()
                local hr = tonumber(hour)
                if hr >= 5 and hr < 12 then
                    return "morning"
                elseif hr >= 12 and hr < 17 then
                    return "afternoon"
                elseif hr >= 17 and hr < 20 then
                    return "evening"
                else
                    return "night"
                end
            end

            if string.len(hour) == 1 then
                hour = "0" .. hour
            end

            if string.len(minute) == 1 then
                minute = "0" .. minute
            end

            local function getUsername()
                local username = os.getenv("USER")
                if username then
                    return (username:gsub("^%l", string.upper))
                else
                    return "User"
                end
            end

            local greet = "Good " ..
                currentGreet() .. ", " .. getUsername() .. ". It is " .. hour .. ":" .. minute
            local msg = {
                asciiArt,
                greet
            }
            return vim.iter(msg):flatten():totable()
        end
        local function buttons()
            local btns = {
                dashboard.button("f", " Find file", ":Telescope find_files <CR>"),
                dashboard.button("r", " Recent files", ":Telescope oldfiles <CR>"),
                dashboard.button("u", " Update plugins", ":Lazy sync<CR>"),
                dashboard.button("m", " Update Mason", ":MasonUpdate<CR>"),
                dashboard.button("n", " New file", ":enew | startinsert<CR>"),
                dashboard.button("q", " Quit", ":qa<CR>"),
            }
            return btns
        end

        local function footer()
            local version = vim.version()
            return "Neovim " .. version.major .. "." .. version.minor .. "." .. version.patch
        end

        dashboard.section.header.val = header()
        dashboard.section.header.opts.hl = "Keyword"
        dashboard.section.header.opts.position = "center"
        dashboard.section.header.type = "text"
        dashboard.section.buttons.opts.hl = "Type"
        dashboard.section.footer.opts.hl = "Comment"
        dashboard.opts.opts.noautocmd = true

        dashboard.section.buttons.val = buttons()
        dashboard.section.footer.val = footer()
        require('alpha').setup(dashboard.opts)
    end
};
