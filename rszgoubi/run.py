from __future__ import absolute_import, division, print_function
from pykern import pksubprocess


def zgoubi():
    pksubprocess.check_call_with_signals(['zgoubi'])
