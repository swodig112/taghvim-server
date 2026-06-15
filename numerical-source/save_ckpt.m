function save_ckpt(filename, ckpt)
    outckpt = ckpt;
    tmpfile = [filename ".tmp"];
    save(tmpfile, 'outckpt', '-v6');
    movefile(tmpfile, filename, 'f');
