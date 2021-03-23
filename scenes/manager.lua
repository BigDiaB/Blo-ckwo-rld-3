local MNGR = {}

function MNGR:init()
	local manager = {}
	manager.currentScene = nil

	function manager.start(scene)
		looper.loopMe(scene)
		loader.loadMe(scene)
		ui_render.renderMe(scene,1)
		manager.currentScene = scene
		require("engine/assets").load()
		manager.assets()
	end

	function manager.stop(scene)
		if manager.currentScene == scene then
			looper.stopMe(scene)
			loader.unloadeMe(scene)
			ui_render.destroyMe(scene,1)
		end
	end

	function manager.replace(scene)
		manager.stop(manager.currentScene)
		manager.start(scene)
	end
	
	function manager.assets()
		manager.currentScene.assets()
	end

	return manager
end

return MNGR