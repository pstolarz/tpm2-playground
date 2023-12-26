.PHONY: all clean

LOCAL_DIR:=../local

ALL:=\
	  simple_sign

all: $(ALL)

clean:
	$(RM) $(ALL)

CFLAGS:=-I$(LOCAL_DIR)/include -L$(LOCAL_DIR)/lib
LIBS:=-ltss2-fapi -ltss2-rc -lcrypto

%: %.c
	$(CC) $(CFLAGS) $< -o $@ $(LIBS)

RUN_ALL:=$(addsuffix ;,$(ALL))
RUN_ALL:=$(addprefix LD_LIBRARY_PATH=$(LOCAL_DIR)/lib ./,$(RUN_ALL))

run: $(ALL)
	$(RUN_ALL)
