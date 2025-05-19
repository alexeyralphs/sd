# For CPU render:
export COMMANDLINE_ARGS="--api --api-auth $admin_name:$PASSWORD --lowvram --opt-sdp-attention --enable-insecure-extension-access --upcast-sampling --update-check --no-half-vae --skip-torch-cuda-test --no-half --use-cpu all"
# For GPU render:
# export COMMANDLINE_ARGS="--api --api-auth $admin_name:$PASSWORD --lowvram --opt-sdp-attention --enable-insecure-extension-access --upcast-sampling --update-check --no-half-vae --skip-torch-cuda-test"
export LD_PRELOAD=libtcmalloc.so.4
