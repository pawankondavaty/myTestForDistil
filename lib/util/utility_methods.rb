module UtilityMethods

	def readYamlData(fieldName, fieldValue)
		@@config = YAML.load_file("#{File.dirname(__FILE__)}/../../Config.yaml")
		if (@@config[fieldName][fieldValue].nil?) then
			return ""
		else
			return @@config[fieldName][fieldValue]
		end
	end

	def ajax_wait(timeout = 60)
		begin
			self.wait_for_ajax(timeout, message = "FAILURE:: Hit the max 60 second rule for Ajax loading time.")
		rescue => e
		  	LOG.info("#{e.message}")
			LOG.info("The wait on this step exceeded 60 secs")
		end
	end
		
	def add_har_to_browser(profile)
		#add Firebug to Browser
		firebug_path = File.dirname(__FILE__)+"/../../features/support/extensions/firebug.xpi"
		netExport_path = File.dirname(__FILE__)+"/../../features/support/extensions/netExport-0.9b7.xpi"

		profile.add_extension(firebug_path) rescue p "Cannot add Firebug to profile"
		profile['extensions.firebug.currentVersion'] = "2.0.11"
    profile['extensions.firebug.app.update.enabled'] = false
		profile['extensions.firebug.allPagesActivation'] = "on"
		profile['extensions.firebug.defaultPanelName'] = "net"
		profile['extensions.firebug.net.enableSites'] = true
		profile['extensions.firebug.net.defaultPersist'] = true
		profile['extensions.firebug.previousPlacement'] = "3"

		#add NetExport to Browser
		profile.add_extension(netExport_path) rescue p "Cannot add NetExport to profile"
		profile['extensions.firebug.netexport.alwaysEnableAutoExport'] = true
		profile['extensions.firebug.netexport.autoExportToFile'] = true
		profile['extensions.firebug.netexport.showPreview'] = false
		profile['extensions.firebug.netexport.saveFiles'] = true

		har_location = File.dirname(__FILE__)+"/../../artifacts/har/"
		profile['extensions.firebug.netexport.defaultLogDir'] = har_location.gsub('/', '\\')
	end

end

