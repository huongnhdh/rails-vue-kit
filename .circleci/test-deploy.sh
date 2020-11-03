#!/bin/bash -eo pipefail
CHATWORK_LFTV_ROOM_ID="23323"
send(){
  curl -X POST -H "X-ChatWorkToken: ${CHATWORK_TOKEN}" -d "body=Deploy on \"production environment\" $BODY_MESSAGE&self_unread=0" "https://api.chatwork.com/v2/rooms/${CHATWORK_LFTV_ROOM_ID}/messages"
}
# set messages by status
if [ "on_fail" == "start" ]; then
  STATUS_MESSAGE="starting..."
elif [ "${CIRCLE_BRANCH}" == "finish" ]; then
  STATUS_MESSAGE="finished (cracker)"
elif [ "${CIRCLE_BRANCH}" == "failed" ]; then
  STATUS_MESSAGE="failed (sweat)"
else
  STATUS_MESSAGE="test thui :D "
fi
# set messages by branch
if [ "${CIRCLE_BRANCH}" == "master" ]; then
  ENVIRONMENT=production
elif [ "${CIRCLE_BRANCH}" == "delivery" ]; then
  ENVIRONMENT=staging
else
  ENVIRONMENT=test
fi
BODY_MESSAGE="Deploy on \"$ENVIRONMENT environment\" was $STATUS_MESSAGE"

send
