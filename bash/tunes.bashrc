#!/usr/bin/env bash

readonly PROJECTS="$HOME/Documents"

# tunes
tuneup() {
	local repo_root
	repo_root=$(_get_repo_root) || return 1

	local project_tunes
	project_tunes=$(_get_project_tunes "$@") || return 1

	echo "creating symlinks:" >&2
	_backup_git_info_exclude "$project_tunes" "$repo_root" &&
		_symlink_tunes "$project_tunes" "$repo_root"
}

tunedown() {
	local repo_root
	repo_root=$(_get_repo_root) || return 1

	local project_tunes
	project_tunes=$(_get_project_tunes "$@") || return 1

	echo "removing symlinks:" >&2
	_rollback_tunes "$project_tunes" "$repo_root" &&
		_restore_git_info_exclude "$project_tunes" "$repo_root"
}

_backup_git_info_exclude() {
	if [[ ! -f "$1/.git_info_exclude" ]]; then
		# no need to backup
		return 0
	fi

	if [[ -f "$2/.git/info/exclude.bak" ]]; then
		echo "already tuned, tunedown first" >&2
		return 1
	fi

	mv "$2/.git/info/exclude" "$2/.git/info/exclude.bak"
    ln -s --verbose "$1/.git_info_exclude" "$2/.git/info/exclude"
}

_restore_git_info_exclude() {
	if [[ ! -f "$1/.git_info_exclude" ]]; then
		# no need to restore
		return 0
	fi

	if [[ ! -f "$2/.git/info/exclude.bak" ]]; then
		echo "no backup found!"
		return 1
	fi

	mv "$2/.git/info/exclude.bak" "$2/.git/info/exclude"
}

_get_project_tunes() {
	local prefix="${1:+/$1}"
	local project_tunes="$DOCS_PRIVATE$prefix${repo_root#"$PROJECTS"}/tunes"
	if [ ! -d "$project_tunes" ]; then
		echo "no project tunes found at $project_tunes" >&2
		return 1
	fi

	echo "$project_tunes"
}

_symlink_tunes() {
	# use extended globbing to exclude file in cp
	shopt -s dotglob
    cp --verbose --symbolic-link --recursive "$1/"!('.git_info_exclude') "$2"
	shopt -u dotglob
}

_rollback_tunes() {
	# find all symlinks in $2 leading to $1 and delete them
	find "$2" -type l -lname "$1/*" -print -delete
}

_is_git_repo() {
	git rev-parse --is-inside-work-tree >/dev/null 2>&1
	return $?
}

_get_repo_root() {
	if ! _is_git_repo; then
		echo "only projects under git can be tuned" >&2
		return 1
	fi

	local repo_root
	repo_root=$(git rev-parse --show-toplevel)
	if [[ "$repo_root" != "$PROJECTS"/* ]]; then
		echo "only projects inside $PROJECTS can be tuned" >&2
		return 1
	fi

	echo "$repo_root"
}
