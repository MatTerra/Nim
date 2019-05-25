#
#
#            Nim's Runtime Library
#        (c) Copyright 2019 Ico Doornekamp
#
#    See the file "copying.txt", included in this
#    distribution, for details about the copyright.
#

# Low level dataspace allocator for the linux kernel

when not defined(kernel):
  {.error: "kernel only module".}
  
proc kmalloc(size: csize, flags: cint): pointer {.header: "linux/slab.h", importc: "kmalloc"}
var GFP_KERNEL {.header: "linux/gfp.h", importc: "GFP_KERNEL"}: cint

proc osAllocPages(size: int): pointer =
  echo "osAllocPages"
  return kmalloc(size, GFP_KERNEL)

proc osTryAllocPages(size: int): pointer =
  echo "osTryAllocPages"
  return nil

proc osDeallocPages(p: pointer; size: int) =
  echo "osDeallocPages"
  discard
