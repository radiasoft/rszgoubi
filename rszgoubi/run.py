from __future__ import absolute_import, division, print_function
from pykern import pksubprocess

ZGOUBI = 'zgoubi'


def zgoubi():
    """
    Executes zgoubi, expects to find zgoubi in the PATH
    """
    pksubprocess.check_call_with_signals([ZGOUBI])
