#!/usr/bin/env bash
# Upload the freshly built resume to Google Drive, so the Drive folder mirrors
# the local folder: only the latest Resume_Anbu_*.pdf is kept.
#
# Usage: ./upload-to-drive.sh Resume_Anbu_Nov_10_2026_17-41.pdf
#
# The websites link to the Drive *folder*, not to the file, so the file's Drive
# ID doesn't matter. We simply:
#   1. upload the new PDF to the folder,
#   2. move every other Resume_Anbu_*.pdf there to the Drive trash
#      (recoverable for 30 days).
# Other files in the folder are never touched.
#
# Any failure (offline, rclone not configured, auth expired) only prints a
# warning and exits non-zero; the Makefile ignores the exit code so the local
# PDF is always kept.

# Drive location agreed on: the "Resume" folder on the "google-drive:" rclone remote.
REMOTE_DIR="google-drive:Resume"

NEW_NAME="$1"

warn() {
    echo "WARNING: Drive upload skipped: $*" >&2
    echo "         The local PDF ($NEW_NAME) was still built." >&2
    exit 1
}

[ -n "$NEW_NAME" ] || warn "no PDF name given"
[ -f "$NEW_NAME" ] || warn "$NEW_NAME does not exist"
command -v rclone >/dev/null || warn "rclone is not installed"

# 1. Upload. Done first, so a failed upload never leaves the folder empty.
echo "Drive: uploading $NEW_NAME to $REMOTE_DIR"
rclone copyto "$NEW_NAME" "$REMOTE_DIR/$NEW_NAME" \
    || warn "upload failed (offline or rclone auth problem)"

# 2. Trash older resumes. --include limits the listing to our naming pattern,
#    so nothing else in the folder is ever touched.
old=$(rclone lsf --files-only --include 'Resume_Anbu_*.pdf' "$REMOTE_DIR") \
    || warn "uploaded, but could not list $REMOTE_DIR to remove older copies"

for name in $old; do
    [ "$name" = "$NEW_NAME" ] && continue    # keep the one we just uploaded
    echo "Drive: moving $name to trash"
    # --drive-use-trash=true forces "move to trash" even if the remote's config says otherwise.
    rclone deletefile --drive-use-trash=true "$REMOTE_DIR/$name" \
        || echo "WARNING: could not remove $name" >&2
done

echo "Drive: done."
