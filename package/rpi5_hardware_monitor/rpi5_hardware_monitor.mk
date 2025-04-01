RPI5_HARDWARE_MONITOR_VERSION := 2.0.2
RPI5_HARDWARE_MONITOR_SITE := https://github.com/paulosell/rpi-hardware-monitor.git
RPI5_HARDWARE_MONITOR_SITE_METHOD := git

define RPI5_HARDWARE_MONITOR_BUILD_CMDS
	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) AR=$(TARGET_AR) LDFLAGS=$(TARGET_LDFLAGS) -C $(@D) all 
endef

define RPI5_HARDWARE_MONITOR_INSTALL_TARGET_CMDS
  $(INSTALL) -D -m 0755 $(@D)/src/monitor $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
