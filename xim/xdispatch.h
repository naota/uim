/*

  Copyright (c) 2003-2010 uim Project http://code.google.com/p/uim/

  All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions
  are met:

  1. Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
  2. Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.
  3. Neither the name of authors nor the names of its contributors
     may be used to endorse or promote products derived from this software
     without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE
  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  SUCH DAMAGE.
*/

// -*- C++ -*-
//
// dispatcher of Xlib events for window.
//
#ifndef UIM_XIM_XDISPATCH_H
#define UIM_XIM_XDISPATCH_H

#include <X11/X.h>

class WindowIf {
public:
    virtual ~WindowIf();
    virtual void expose(Window) = 0;
    virtual void destroy(Window) = 0;
    virtual void resize(Window, int w, int h);
};

// Xlib event
#define EXPOSE_MASK (1<<15)
#define STRUCTURE_NOTIFY_MASK (1<<17)

void add_window_watch(Window id, WindowIf *, int mask);
void remove_window_watch(Window id);

#endif
/*
 * Local variables:
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 */
