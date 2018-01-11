# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := libp11
$(PKG)_WEBSITE  := https://github.com/OpenSC/libp11
$(PKG)_DESCR    := PKCS11 wrapper library
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.4.7
$(PKG)_CHECKSUM := a16878d7b6246db574e71288e38faa94d4d91d324f2daed3d920b3a50a0a69bf
$(PKG)_GH_CONF  := OpenSC/libp11/tags,'libp11\-'
$(PKG)_DEPS     := cc autoconf openssl

define $(PKG)_BUILD
    # build and install the library
    cd '$(SOURCE_DIR)' && ./bootstrap && cd '$(BUILD_DIR)' && '$(SOURCE_DIR)/configure' \
        $(MXE_CONFIGURE_OPTS) \
        $(MXE_DISABLE_CRUFT)
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install

    # compile test
    '$(TARGET)-gcc' \
        -W -Wall -Werror -ansi -pedantic \
        '$(TEST_FILE)' -o '$(PREFIX)/$(TARGET)/bin/test-$(PKG).exe' \
        `'$(TARGET)-pkg-config' $(PKG) --cflags --libs`
endef
