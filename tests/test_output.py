# -*- coding: utf-8 -*-
from __future__ import absolute_import, division, print_function
from pykern import pkio
from pykern import pkunit

ZGOUBI_DAT = 'zgoubi.dat'
ZGOUBI_RES = 'zgoubi.res'


def test_SRDampingInESRFRing_coupled():
    from rszgoubi.output import compare_results_format
    from rszgoubi.run import zgoubi

    with pkunit.save_chdir_work(), open('diff.txt', 'w+') as df:
        fn = pkunit.data_dir().join('SRDampingInESRFRing.coupled.100.1.res')
        pkio.write_text(ZGOUBI_DAT, pkio.read_text(fn))
        zgoubi()
        compare_results_format(ZGOUBI_DAT, ZGOUBI_RES, df)
        df.seek(0)
        assert df.read() == ''
