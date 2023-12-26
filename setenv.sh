SCRDIR=$(readlink -f $(dirname ${BASH_SOURCE[0]}))

export PATH=${SCRDIR}/local/bin:${PATH}
export MANPATH=${SCRDIR}/local/share/man:/usr/share/man
export LD_LIBRARY_PATH=${SCRDIR}/local/lib
