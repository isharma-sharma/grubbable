API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/friendships" \
curl "${API}${URL_PATH}/1" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
