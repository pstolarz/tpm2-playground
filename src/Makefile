.PHONY: all clean

INSTALL_DIR?=../local

ALL:=\
	  fapi_simple_sign

all: $(ALL)

clean:
	$(RM) $(ALL)

CFLAGS:=-I$(INSTALL_DIR)/include -L$(INSTALL_DIR)/lib
LIBS:=-ltss2-fapi -ltss2-rc -lcrypto

%: %.c
	$(CC) $(CFLAGS) $< -o $@ $(LIBS)

RUN_ALL:=$(addsuffix ;,$(ALL))
RUN_ALL:=$(addprefix LD_LIBRARY_PATH=$(INSTALL_DIR)/lib ./,$(RUN_ALL))

run: $(ALL)
	$(RUN_ALL)
