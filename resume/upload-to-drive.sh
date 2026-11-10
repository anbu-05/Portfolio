#!/usr/bin/env bash
# Upload the freshly built resume to Google Drive, replacing the old one IN PLACE.
#
# Usage: ./upload-to-drive.sh Resume_Anbu_Nov_10_2026.pdf
#
# Why "in place": the Drive "Resume" folder (and possibly the file itself) is
# linked from websites. Deleting and re-uploading would give the file a new ID
# and break direct file links. Instead we:
#   1. find the existing Resume_Anbu_*.pdf in the Drive folder,
#   2. rename it to today's name (server-side rename keeps the same file ID),
#   3. copy the new PDF over it (rclone updates the existing file's contents).
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

# List existing resume PDFs in the Drive folder (names only, files only).
# --include filters to our naming pattern so other files in the folder are never touched.
existing=$(rclone lsf --files-only --include 'Resume_Anbu_*.pdf' "$REMOTE_DIR" 2>&1) \
    || warn "could not list $REMOTE_DIR (offline or rclone auth problem): $existing"

count=$(printf '%s\n' "$existing" | grep -c . || true)

if [ "$count" -gt 1 ]; then
    # More than one match is unexpected; refuse to guess which one is linked.
    warn "found $count Resume_Anbu_*.pdf files in $REMOTE_DIR, expected at most 1:
$existing"
fi

if [ "$count" -eq 1 ] && [ "$existing" != "$NEW_NAME" ]; then
    echo "Drive: renaming $existing -> $NEW_NAME"
    rclone moveto "$REMOTE_DIR/$existing" "$REMOTE_DIR/$NEW_NAME" \
        || warn "rename on Drive failed"
fi

# Upload the contents. If a file with this name exists (the one we just renamed,
# or one from an earlier build today) rclone updates it instead of making a new one.
echo "Drive: uploading $NEW_NAME to $REMOTE_DIR"
rclone copyto "$NEW_NAME" "$REMOTE_DIR/$NEW_NAME" \
    || warn "upload failed"

echo "Drive: done."
