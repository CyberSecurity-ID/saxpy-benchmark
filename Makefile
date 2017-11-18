#
# Instructions:
#  You need to do three steps, see below
#

###################################################################
# Step 1: Configure your compiler
###################################################################
# Windows / Visual Studio tools
CC = cl
CC_O = /Fe:
CFLAGS = /Ox /EHsc /TP
EXE = .exe
RM = del

# Linux/MacOS/Unix tools
#CC = g++
#CC_O = -o
#CFLAGS = -O3 -std=c++11
#EXE =
#RM = rm -f


###################################################################
# Step 2: Select which implementations to enable
################################################################### 
TARGETS = saxpy_cpu$(EXE) \
          saxpy_ocl1$(EXE) \
          saxpy_ocl2$(EXE) \
          SaxpyLoop.class \
          saxpy_oclso$(EXE) \
          saxpy_cuda$(EXE) \
		  saxpy_omp$(EXE)


###################################################################
# Step 3: Configure additional settings for the SDKs
###################################################################

#
# OpenCL settings
#

# Typical settings for MacOS:
#
#OCL_CFLAGS =
#OCL_LDFLAGS = -framework OpenCL

# Sample settings for Windows:
#
# With OpenCL From CUDA SDK
#OCL_CFLAGS = /I"C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v8.0\include"
#OCL_LDFLAGS = /link /LIBPATH:"C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v8.0\lib\x64" OpenCL.lib

# With Intel OpenCL
OCL_CFLAGS = /I"$(INTELOCLSDKROOT)/include"
OCL_LDFLAGS = /link /LIBPATH:"$(INTELOCLSDKROOT)/lib/x64" OpenCL.lib

#
# OpenMP settings
#
#OMP_CFLAGS = -O3 -std=c++11 -fopenmp -I/usr/local/octave/3.8.0/lib/gcc47/gcc/x86_64-apple-darwin13/4.7.3/include
#OMP_LDFLAGS = -L/usr/local/octave/3.8.0/lib/gcc47

OMP_CFLAGS = /Ox /EHsc /openmp
OMP_LDFLAGS =

###################################################################
# Done. 
# Usually you don't need to change anything beyond this point
###################################################################

all: $(TARGETS)
	cd results && $(MAKE)

saxpy_cpu$(EXE): saxpy_cpu.cpp saxpy.h
	$(CC) $(CFLAGS) $(CC_O) $(@) saxpy_cpu.cpp

saxpy_cuda$(EXE): saxpy_cuda.cpp saxpy.h
	nvcc -Wno-deprecated-gpu-targets --x cu -o saxpy_cuda$(EXE) saxpy_cuda.cpp
		
saxpy_ocl1$(EXE): saxpy_ocl1.cpp saxpy.h
	$(CC) $(CFLAGS) $(OCL_CFLAGS) $(CC_O) $(@) saxpy_ocl1.cpp $(OCL_LDFLAGS)
	
saxpy_ocl2$(EXE): saxpy_ocl2.cpp saxpy.h
	$(CC) $(CFLAGS) $(OCL_CFLAGS) $(CC_O) $(@) saxpy_ocl2.cpp $(OCL_LDFLAGS)

saxpy_oclso$(EXE): saxpy_oclso.cpp
	$(CC) $(CFLAGS) $(OCL_CFLAGS) $(CC_O) $(@) saxpy_oclso.cpp $(OCL_LDFLAGS)
	
saxpy_omp$(EXE): saxpy_omp.cpp saxpy.h
	$(CC) $(OMP_CFLAGS) $(OMP_LDFLAGS) saxpy_omp.cpp $(CC_O) $(@) 

SaxpyLoop.class: SaxpyLoop.java
	javac SaxpyLoop.java
	
clean:
	$(RM) $(TARGETS) *.lib *.a *.exe *.obj *.o *.exp *.pyc

