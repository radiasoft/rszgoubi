from __future__ import absolute_import, division, print_function
from pykern import pksubprocess

ZGOUBI = 'zgoubi'


def zgoubi():
    pksubprocess.check_call_with_signals([ZGOUBI])
