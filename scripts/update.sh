API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/update-info"
curl "${API}${URL_PATH}/3" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "name": "'"${NAME}"'",
      "address": "'"${ADDRESS}"'",
      "age": "'"${AGE}"'"
    }
  }'

echo
