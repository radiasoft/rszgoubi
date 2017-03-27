from __future__ import absolute_import, division, print_function
import subprocess

DIFF = 'diff'

def compare_results_format(filename_original, filename_new, diff_output):
    p = subprocess.Popen(
        [
            DIFF, '-ICPU', '-I[JobOB]',
            filename_original,
            filename_new,

        ],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )

    out, err = p.communicate()
    diff_output.write(out)
