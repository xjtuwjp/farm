#include <pthread.h>
#include <unistd.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/msg.h>
#include <time.h>
#include <sys/stat.h>
#include <fcntl.h>

#ifndef CALSPD_H
#define CALSPD_H

struct colbwmesg {
	long	msgtype;
	char	datainfo[32];
};
typedef struct colbwmesg Colbwmesg;

long totallen;		/* totally received data length */

long timestamp;

int interval;

int fd;			/* log file */

void *anabw(void *);

void prtinfo(long);

#endif
