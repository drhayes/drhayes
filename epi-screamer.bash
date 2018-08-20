function screamer-ls {
  local prefix='v2'
  # aws s3 cp s3://glg-epi-screamer/v2/147832e09fa7d34c96bae5eee5b59debd77c5d8a/context.json - | jq .
  if [ $# -lt 1 ]; then
    >&2 echo "Usage: $0 <sha>"
    return
  fi

  aws s3 ls s3://glg-epi-screamer/$prefix/$1/
}

function screamer-cp {
  local prefix='v2'
  # aws s3 cp s3://glg-epi-screamer/v2/147832e09fa7d34c96bae5eee5b59debd77c5d8a/context.json - | jq .
  if [ $# -lt 2 ]; then
    >&2 echo "Usage: $0 <sha> <file-to-copy>"
    return
  fi

  aws s3 cp s3://glg-epi-screamer/$prefix/$1/$2 -
}
