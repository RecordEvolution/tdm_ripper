# cython: language_level = 3
# distutils: language = c++

from tdm_ripper cimport tdm_ripper

cdef class pytdmripper:

    # pointer to C++ instance (since there's no nullary constructor)
    cdef tdm_ripper *cripp

    def __cinit__(self, string tdmfile):
        self.cripp = new tdm_ripper(tdmfile)

    def __dealloc__(self):
        del self.cripp

    def show_channels(self):
        self.cripp.show_channels()

    def num_channels(self):
        return self.cripp.num_channels()

    def num_groups(self):
        return self.cripp.num_groups()

    def get_channel(self, int channelid):
        return self.cripp.get_channel(channelid)

    def print_channel(self, int channelid, const char* filename):
        self.cripp.print_channel(channelid,filename)
