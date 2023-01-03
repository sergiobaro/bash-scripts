#!/usr/bin/env bash

CURRENT_REPORT='current-report.log'
> $CURRENT_REPORT
PREVIOUS_REPORT='previous-report.log'
> $PREVIOUS_REPORT
for ((i=0; i<4; i++)); do
    echo 'always-talking' >> $CURRENT_REPORT
    echo 'always-talking' >> $PREVIOUS_REPORT
    echo 'going-away' >> $PREVIOUS_REPORT
done

diff -u \
    <(cut -f1 $PREVIOUS_REPORT | sort -u) \
    <(cut -f1 $CURRENT_REPORT | sort -u)
