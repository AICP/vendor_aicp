#!/usr/bin/env python
#
# Copyright (C) 2009 The Android Open Source Project
# Copyright (C) 2014 SlimRoms Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import os
import sys

# give us access to import the original post_process_props
sys.path.append(os.path.join(os.getenv('ANDROID_BUILD_TOP'), 'build/tools'))
from post_process_props import PropFile, validate


lcd_changer = {"213": "182", "240": "200",
               "320": "280", "480": "400", "560" : "480"}


def mangle_lcd_prop(prop):
    new_lcd = prop.get('persist.sys.lcd_density')
    if new_lcd == '':
        lcd = prop.get('ro.sf.lcd_density')
        new_lcd = lcd_changer.get(lcd, lcd)
    if new_lcd != '':
        prop.put('persist.sys.lcd_density', new_lcd)
        prop.put('ro.sf.lcd_density', new_lcd)


def mangle_build_prop(prop):
    mangle_lcd_prop(prop)


def mangle_default_prop(prop):
    mangle_lcd_prop(prop)


def main(argv):
    fn = argv[1]
    with open(fn) as f:
        lines = f.readlines()
    properties = PropFile(lines)

    if fn.endswith('/build.prop'):
        mangle_build_prop(properties)
    elif fn.endswith('/default.prop'):
        mangle_default_prop(properties)
    else:
        sys.stderr.write("%s: Unsupported file: %s\n" % (os.path.realpath(__file__), fn))
        sys.exit(1)

    if not validate(properties):
        # the validate routine prints on error
        sys.exit(1)

    with open(fn, 'w+') as f:
        properties.write(f)

if __name__ == '__main__':
    main(sys.argv)
