#! /usr/bin/python

import thread
from Tkinter import *

def rml(root):
  fm = Frame(root, width=200, height=200, bg="white")
  fm.pack(side=TOP, expand=YES, fill=NONE)
  while TRUE:
    a=raw_input()
    fm.config(bg = a)

root = Tk()
root.title("Color")
root.geometry("200x200")

thread.start_new(rml, (root,))
root.mainloop()
