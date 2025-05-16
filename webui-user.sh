# For CPU render:
export COMMANDLINE_ARGS="--autolaunch --gradio-auth $admin_name:$PASSWORD --api --api-auth $admin_name:$PASSWORD --upcast-sampling --update-check --no-half-vae --medvram-sdxl --opt-sdp-attention --skip-torch-cuda-test --no-half --enable-insecure-extension-access --use-cpu all"
# For GPU render:
# export COMMANDLINE_ARGS="--autolaunch --gradio-auth $admin_name:$PASSWORD --api --api-auth $admin_name:$PASSWORD --upcast-sampling --update-check --no-half-vae --medvram-sdxl --opt-sdp-attention --skip-torch-cuda-test --no-half --enable-insecure-extension-access --xformers"
