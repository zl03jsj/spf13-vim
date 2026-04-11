local M = {}

function M:setup()
	local last = 0

	local refresh = function(force)
		local now = os.time()
		if not force and now - last < 1 then
			return
		end
		last = now

		local cwd = tostring(cx.active.current.cwd)
		local emit = ya.emit or ya.manager_emit
		emit("plugin", { "starship-fixed", ya.quote(cwd, true) })
	end

	ps.sub("cd", function()
		refresh(true)
	end)
	ps.sub("tab", function()
		refresh(true)
	end)
	ps.sub("load", function()
		refresh(true)
	end)
	ps.sub("hover", function()
		refresh(false)
	end)
end

return M
