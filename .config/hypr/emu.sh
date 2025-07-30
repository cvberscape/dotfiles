#!/bin/bash

emulator @$(emulator -list-avds | head -n 1)
