include $(TOPDIR)/rules.mk

PKG_NAME:=arednui
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/arednui
  SECTION:=base
  CATEGORY:=Network
  TITLE:=AREDN Angular UI
  URL:=http://www.arednmesh.org/
  MAINTAINER:=Darryl Quinn - K5DLQ <k5dlq@arednmesh.org>
endef

define Package/arednui/description
  New Angular based web user interface
endef

define Build/Compile
#!/bin/sh
  ng build
fi
endef

define Package/arednui/install
#!/bin/sh
  echo "TODO: install"
  set
  cp $(1)/www/index.html $(1)/www/index.orig
fi
  $(INSTALL_DIR)/dist/aredn-frontend $(1)/www
endef

define Package/arednui/postinst
#!/bin/sh
  echo "Installation complete.   Access the UI at http://localhost.local.node"
fi
exit 0
endef

define Package/arednui/postrm
#!/bin/sh
  if [ -z "$${IPKG_INSTROOT}" ]; then
  echo "Removing files.  TODO..."
  cp $(1)/www/index.orig $(1)/www/index.html
  cp 
fi
exit 0
endef

$(eval $(call BuildPackage,arednui))