SCRDIR=$(readlink -f $(dirname ${BASH_SOURCE[0]}))

if [ ! -e ${SCRDIR}/local/lib/libtss2-tcti-default.so ]; then
  ln -s ${SCRDIR}/ local/lib/libtss2-tcti-swtpm.so ${SCRDIR}/local/lib/libtss2-tcti-default.so
fi
