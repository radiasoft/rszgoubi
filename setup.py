# -*- coding: utf-8 -*-
u"""rszgoubi setup script

:copyright: Copyright (c) 2017 RadiaSoft LLC.  All Rights Reserved.
:license: http://www.apache.org/licenses/LICENSE-2.0.html
"""
# All imports (except __future__) must come after this block.
# setuptools, in particular, caches data about the current state
# of modules so it has to be imported after the pykern import.
try:
    from pykern import pksetup
except ImportError:
    import pip
    pip.main(['install', 'pykern'])
    from pykern import pksetup


pksetup.setup(
    name='rszgoubi',
    author='RadiaSoft LLC',
    author_email='pip@radiasoft.net',
    description='Python library for working with the Zgoubi spin dynamics code',
    license='http://www.apache.org/licenses/LICENSE-2.0.html',
    url='https://github.com/radiasoft/rszgoubi',
    classifiers=[
        'Development Status :: 2 - Pre-Alpha',
        'Environment :: Console',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: Apache Software License',
        'Natural Language :: English',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python',
        'Topic :: Utilities',
    ],
)
