# -*- coding: utf-8 -*-
from __future__ import absolute_import, division, print_function
from pykern import pkio
from pykern import pkunit
import pytest

ZGOUBI_DAT = 'zgoubi.dat'
ZGOUBI_RES = 'zgoubi.res'

@pytest.mark.parametrize(
    'test_file',
    [
        'AGS_Booster_OPTICS.res',
        'RHIC_TWISS_blue_coupled.res',
        'SRDampingInESRFRing.coupled.res',
        'microBeamDoublet_bqpole_matrix.res',
        'spiralFFAG-FFAG-SPI.res',
    ]
)
def test_SRDampingInESRFRing_coupled(test_file):
    """
    Runs zgoubi for a selection of simulation results and compares the
    new results agains the old results.

    Comaparison is done by looking at differences in the output format, ignoring
    non-essential information like dates.
    """
    from rszgoubi.output import compare_results_format
    from rszgoubi.run import zgoubi

    with pkunit.save_chdir_work(), open('diff.txt', 'w+') as df:
        fn = pkunit.data_dir().join(test_file)
        pkio.write_text(ZGOUBI_DAT, pkio.read_text(fn))
        zgoubi()
        compare_results_format(test_file, ZGOUBI_RES, df)
        df.seek(0)
        assert df.read() == ''
