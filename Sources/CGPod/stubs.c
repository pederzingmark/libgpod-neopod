/* Neopod only writes classic iPods (iTunesDB). The sqlite-based database
 * (nano 6G/7G, touch) and iPhone sync are not supported, so these refuse. */
#include <glib.h>
#include "itdb.h"
#include "itdb_private.h"

int itdb_sqlite_generate_itdbs(FExport *fexp) { return -1; }
int itdb_iphone_start_sync(Itdb_Device *device, void **prepdata) { return -1; }
int itdb_iphone_stop_sync(void *sync_ctx) { return -1; }
