local Module = {} --Das Modul definieren

	function Module.init(self) --Das Modul initialisieren
		someVar = 69 --Alle nötigen lokalen und globalen Variablen definieren
		self.someOtherVar = 96
		self.module = {}


		self.module.func = function() end --Nebenfunktion, die Keine Draw- ,Ui- ,Kill- oder Update-Funktion ist
		
		Module.update = function(dt) --Update-Funktion die jeden ausgeführt wird
		end

		Module.draw = function() --Draw-Funktion die im Draw-Cycle ausgeführt wird
		end

		Module.kill = function() --Eine Funktion, die das Modul vom Obj entfernt, wenn es zerstört wird
		end

		table.insert(self.kills,Module.kill) --Hier werden dann zuletzt die Haupt-Funktionen zum Self-Obj hinzugefügt
		table.insert(self.uis,Module.ui)
		table.insert(self.drawers,Module.draw)
		table.insert(self.updates,Module.update)

	end

return Module --das Modul als Obj returnen um es mit "require" zu initialisieren