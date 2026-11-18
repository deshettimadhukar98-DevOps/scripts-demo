#!/bin/bash
set -e   # edaina command fail ayithe script aagipotundi

APP_NAME="my-demo-app"
DEPLOY_ENV="${1:-dev}"      # argument ivvakapothe default dev
VERSION="1.0.$(date +%H%M%S)"

build() {
    echo "[BUILD] $APP_NAME version $VERSION"
    mkdir -p build
    echo "Build output for $APP_NAME" > build/output.txt
}

test_app() {
    echo "[TEST] Running tests..."
    if [ -f build/output.txt ]; then
        echo "[TEST] Passed"
    else
        echo "[TEST] Failed"
        exit 1
    fi
}

package() {
    echo "[PACKAGE] Creating archive..."
    tar -czf "$APP_NAME-$VERSION.tar.gz" build/
}

deploy() {
    echo "[DEPLOY] $APP_NAME to $DEPLOY_ENV"
}

cleanup() {
    rm -rf build
    echo "[CLEANUP] Done"
}

build
test_app
package
deploy
cleanup
echo "SUCCESS: $APP_NAME $VERSION deployed to $DEPLOY_ENV"

