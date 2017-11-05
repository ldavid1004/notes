# jupyter
# 
# Description: desk for doing work with jupyter
#

export SSH='ssh -i /Users/lysander/.ssh/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=false'
export SCP='scp -i /Users/lysander/.ssh/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=false'
export PYENV_VERSION=salt
export PROJECT_BASE=/Users/lysanderdavid/notes/0005_factorchain/0073_fuw2_df_0/0000_TA-655_create_df-0_vpc/0007_TA-682_create_df-0_with_beta

export EDITOR=emacs

# run a command
run_cmd() {
    echo $@
    $@
}

# change directory to fuw2_fc_test_0 project base dir
cdp() {
    run_cmd cd $PROJECT_BASE
}
