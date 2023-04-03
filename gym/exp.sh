# run experiments for 10 times in tmux, in one tmux session, 10 windows
# each window runs one experiment


num_exp=10
#cmd="python3 experiments.py --env hopper --dataset medium --model_type dt --log_to_wandb True"

tmux new-session -d -s exp
for i in $(seq 1 $num_exp)
do
    tmux new-window -t exp:$i -n "exp$i"
    tmux send-keys -t exp:$i "python3 /research/agent-playground/dt/gym/experiment.py --env hopper --dataset medium --model_type dt --max_iters 30 --log_to_wandb True" C-m
done
#tmux attach-session -t exp
echo "============================================="
echo "experiments are running in tmux"
echo "============================================="
echo "tmux command:"
echo $cmd
echo "============================================="
echo "num_exp: $num_exp"
echo "============================================="
echo "tmux session name: exp"
echo "============================================="

