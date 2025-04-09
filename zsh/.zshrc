export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="ys"
plugins=(
        git
        zsh-syntax-highlighting
        zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
alias pycnt='find . -type f -name "*.py" | xargs wc -l'
alias fft='find . -maxdepth 1 -type f | wc -l'
alias fdt='find . -maxdepth 1 -type d | wc -l'


export CUDA_HOME=/usr/local/cuda
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib:$LD_LIBRARY_PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/conda/etc/profile.d/conda.sh" ]; then
        . "/opt/conda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export HF_ENDPOINT=https://hf-mirror.com
export HF_HOME=/data/zhuhu/3DVision_datasets/huggingface
export TORCH_HOME=/data/zhuhu/3DVision_datasets/cache/torch
export GRADIO_TEMP_DIR=/data/zhuhu/3DVision_datasets/cache/gradio
export GRADIO_ALLOWED_PATHS="/data/zhuhu/3DVision_datasets/code"
