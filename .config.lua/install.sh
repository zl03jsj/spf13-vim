SHELL_PATH="$(cd $(dirname "$0"); pwd)"

NVIM_CONFIG_PATH=~/.config/nvim

ln -s -f $SHELL_PATH/nvim $NVIM_CONFIG_PATH

#if [ ! -d "${NVIM_CONFIG_PATH}" ]; then
#  echo create dir $NVIM_CONFIG_PATH
#  mkdir -p ${NVIM_CONFIG_PATH}
## else
##   echo path: $NVIM_CONFIG_PATH already exists.
#fi
#
#ln -s -f $SHELL_PATH/init.lua ${NVIM_CONFIG_PATH}/init.lua

