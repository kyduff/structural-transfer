SAVE_MODEL=targets/nl-bash/run/copy-reruns
PRED_FILE=targets/nl-bash/pred.copy-reruns.txt
LOG_FILE=copy.txt
CONFIG=targets/nl-bash-full-frozen.yaml
GPU=0
TRAIN_FROM=pretraining/copy-tasks/run/training-exact_step_2500.pt

# Configure devices
# export CUDA_VISIBLE_DEVICES=6,7

# Train model
python utils/OpenNMT-py/train.py -config $CONFIG -save_model $SAVE_MODEL \
  -train_from ${TRAIN_FROM} \
  -reset_optim 'all' \
  -update_vocab

# Predict with model
python utils/OpenNMT-py/translate.py \
  -src targets/nl-bash/src-test-full.txt \
  -tgt targets/nl-bash/tgt-test-full.txt \
  -model ${SAVE_MODEL}_step_2500.pt \
  -gpu $GPU \
  -ban_unk_token \
  -output $PRED_FILE

# Evaluate predictions
python utils/clai/utils/eval.py -preds $PRED_FILE -golds targets/nl-bash/tgt-test-full.txt >> $LOG_FILE
