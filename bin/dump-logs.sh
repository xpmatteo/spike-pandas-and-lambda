
log_group_name=/aws/lambda/DemoPandas

log_stream_names=$(aws logs describe-log-streams \
  --log-group-name "$log_group_name" \
  --output text \
  --query 'logStreams[*].logStreamName')
echo log_stream_names="'$log_stream_names'"
for log_stream_name in $log_stream_names; do
  aws logs get-log-events \
    --log-group-name "$log_group_name" \
    --log-stream-name "$log_stream_name" \
    --output text \
    --query 'events[*].message'
done | less
