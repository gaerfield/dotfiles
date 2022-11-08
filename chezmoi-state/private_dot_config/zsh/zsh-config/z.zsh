# ZSHZ_CMD changes the command name (default: z)
# ZSHZ_CMD=z
# ZSHZ_COMPLETION can be 'frecent' (default) or 'legacy', depending on whether you want your completion results sorted according to frecency or simply sorted alphabetically
# ZSHZ_COMPLETION='frecent'
# ZSHZ_DATA changes the database file (default: ~/.z)
ZSHZ_DATA="$ZSH_CACHE_DIR/zshz-cache"
# ZSHZ_ECHO displays the new path name when changing directories (default: 0)
# ZSHZ_EXCLUDE_DIRS is an array of directories to keep out of the database (default: empty)
# ZSHZ_KEEP_DIRS is an array of directories that should not be removed from the database, even if they are not currently available (useful when a drive is not always mounted) (default: empty)
# ZSHZ_MAX_SCORE is the maximum combined score the database entries can have before they begin to age and potentially drop out of the database (default: 9000)
# ZSHZ_NO_RESOLVE_SYMLINKS prevents symlink resolution (default: 0)
# ZSHZ_OWNER allows usage when in sudo -s mode (default: empty)
# ZSHZ_TILDE displays the name of the HOME directory as a ~ (default: 0)
# ZSHZ_TRAILING_SLASH makes it so that a search pattern ending in / can match the final element in a path; e.g., z foo/ can match /path/to/foo (default: 0)
# ZSHZ_UNCOMMON changes the logic used to calculate the directory jumped to; see below (default: 0)
