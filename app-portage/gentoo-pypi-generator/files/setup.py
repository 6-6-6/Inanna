#!/usr/bin/python
# -*- coding:utf-8 -*-

import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="gentoo-pypi-sci",
    version="REDACTED_VERSION",
    author="Chen Jiajie",
    author_email="user@example.org",
    description="Generate ebuild from PyPI packages with ease.",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://isrc.iscas.ac.cn/gitlab/summer2020/students/proj-2027131",
    package_dir={},
    packages=[],
    scripts=["gentoo-pypi-generator"],
    classifiers=[
        "Programming Language :: Python :: 3",
        "Operating System :: OS Independent",
    ],
    install_requires=["requests"],
    python_requires='>=3.7',
)
