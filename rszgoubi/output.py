from __future__ import absolute_import, division, print_function
import difflib


def compare_results(a, b):
    d = difflib.Differ()
    diff = d.compare(open(a).read(), open(b).read())
    return diff
