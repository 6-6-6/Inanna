#!/usr/bin/env python

from pathlib import Path
from sys import argv
import os
import shutil

install_prefix = Path(argv[1])
log_prefix = Path(argv[2])
workdir = Path(argv[3])
command_user = argv[4]

template = """#!/sbin/openrc-run
# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

name="{} daemon"
description="{}"
command={}
command_args="{}"
command_user="{}:{}"
supervisor=supervise-daemon
supervise_daemon_args="--pidfile /run/${{RC_SVCNAME}}.pid"
output_log="{}"
error_log="{}"
directory="{}"
"""

initd_tail = """
start_pre() {{
\tset -o allexport
\tsource {}
\tset +o allexport
}}
""".format(install_prefix / "/etc/overleaf/commons.conf")

web_initd_tail = """stopsig="SIGKILL/5"

depend() {{{{
\tneed redis
\tneed mongodb
{{}}
}}}}

start_pre() {{{{
\tset -o allexport
\tsource {}
\tsource {}
\tset +o allexport
}}}}
""".format(
    install_prefix / "/etc/overleaf/commons.conf",
    install_prefix / "/etc/overleaf/web.conf")

os.chdir("build")
os.makedirs("initds/", exist_ok=True)
components = Path("target/")

web_components = []
for unit in components.glob("*/app.js"):
    svcname = "sharelatex-" + str(unit.parts[-2])
    try:
        description = open(unit.parent / "README.md").readline().strip()
    except BaseException:
        description = svcname
    # maybe search through PATH would be better
    command = shutil.which("node")
    # rename to actual location after intallation
    command_args = install_prefix / \
        unit.relative_to(unit.parts[0])
    # write initd
    initd_content = template.format(
        svcname,
        description,
        command,
        command_args,
        command_user,
        command_user,
        log_prefix / (svcname + '.log'),
        log_prefix / (svcname + '.err'),
        workdir)
    if svcname != "sharelatex-web":
        initd_content += initd_tail
        web_components.append("\tneed " + svcname)
    else:
        web_initd = initd_content
        continue
    open(f"initds/{svcname}", 'w').write(initd_content)

web_initd += web_initd_tail.format("\n".join(web_components))
open("initds/overleaf", 'w').write(web_initd)
