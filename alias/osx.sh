if [ $(uname) = "Darwin" ]; then
  alias unlock='sudo spctl --master-disable'
fi
