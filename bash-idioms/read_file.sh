#!/usr/bin/env bash

grep '^nobody' /etc/passwd | { \
    IFS=':' read user shadow uid gid gecos home shell; \
    echo "$user | $shadow | $uid | $gid | $gecos | $home | $shell"; \
}