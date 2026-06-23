#!/bin/sh

echo "Injecting runtime environment variables..."


GOOGLE_ID=${NEXT_PUBLIC_GOOGLE_CLIENT_ID:-""}

find /app/.next -type f -name "*.js" -exec sed -i "s|__API_URL_PLACEHOLDER__|${NEXT_PUBLIC_API_URL}|g" {} +
find /app/.next -type f -name "*.js" -exec sed -i "s|__STORE_NAME_PLACEHOLDER__|${NEXT_PUBLIC_STORE_NAME}|g" {} +
find /app/.next -type f -name "*.js" -exec sed -i "s|__COMMISSION_PLACEHOLDER__|${NEXT_PUBLIC_AFFILIATE_COMMISSION_PCT}|g" {} +
find /app/.next -type f -name "*.js" -exec sed -i "s|__GOOGLE_ID_PLACEHOLDER__|${GOOGLE_ID}|g" {} +

echo "Starting Next.js server..."

exec node server.js