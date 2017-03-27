# -*- coding: utf-8 -*-
from __future__ import absolute_import, division, print_function
from pykern import pkio
from pykern import pkjinja
from pykern import pkunit

ZGOUBI_DAT = 'zgoubi.dat'
ZGOUBI_RES = 'zgoubi.res'


def test_zgoubi():
    from rszgoubi.output import compare_results
    from rszgoubi.run import zgoubi

    with pkunit.save_chdir_work():
        values = {'turns': 1, 'particles': 100}
        pkjinja.render_file(pkunit.data_dir().join('zgoubi.res.jinja'),
                            values, ZGOUBI_DAT)
        zgoubi()
        assert compare_results(ZGOUBI_DAT, ZGOUBI_RES) == 1
