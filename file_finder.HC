#include "holyc-lib/all.HC"
#define FZF_TMP_FILE "/tmp/fzf.out"

U0 SelectFile() {
  System("ls -a | fzf > " FZF_TMP_FILE);
  I64 fd = FOpen(FZF_TMP_FILE, F_OK_READ);
  if (fd == -1) {
    "Error: could not open " FZF_TMP_FILE "\n";
    return;
  }
  U8 buf[1024];
  MemSet(buf, 0, 1024);
  I64 bytes_read = FRead(fd, buf, 1024);
  if (bytes_read > 0) {
    "You selected: %s", buf;
  }
  FClose(fd);
  System("rm " FZF_TMP_FILE);
}

SelectFile; -